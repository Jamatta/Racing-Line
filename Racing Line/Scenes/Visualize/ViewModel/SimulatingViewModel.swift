//
//  SimulatingViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import SwiftUI

final class SimulatingViewModel: ObservableObject {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    var selectedCircuit: CircuitData?
    private var circuitID: Int?
    var raceName: String?
    var raceYear: String?
    var circuitTable = [Circuit]()
    @Published var raceResults = [RaceResult]()
    
    init(networkManager: NetworkService = Network()) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad(raceYear: String) {
        getRaceID(raceYear)
        self.raceYear = raceYear
    }
    
    //MARK: - Methods
    private func getRaceID(_ raceYear: String) {
        let baseURL = "https://ergast.com/api/f1/"
        let prefixURL = "/circuits.json"
        let year = raceYear
        let url = baseURL + year + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<RaceResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let response = data.mrData.circuitTable?.circuits else {
                        return
                    }
                    self?.circuitTable.append(contentsOf: response)
                    self?.filterRaceID(for: self!.raceName ?? "Name", from: self!.circuitTable)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getRaceResults(_ raceYear: String, _ circuitID: Int) {
        let baseURL = "https://ergast.com/api/f1/"
        let prefixURL = "/results.json"
        let year = raceYear
        let circuitID = "/\(String(circuitID))"
        let url = baseURL + year + circuitID + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<RaceStatisticsResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let statsData = data.mrData, let races = statsData.circuitTable?.races {
                        var firstFiveRaceResults = [RaceResult]()
                        
                        // Fetch only the first 5 race results
                        races.prefix(5).forEach { raceMRData in
                            raceMRData.results?.forEach { resultMRData in
                                let driver = Driver(
                                    driverID: resultMRData.driver?.driverID ?? "",
                                    permanentNumber: resultMRData.driver?.permanentNumber ?? "",
                                    code: resultMRData.driver?.code ?? "",
                                    url: resultMRData.driver?.url ?? "",
                                    givenName: resultMRData.driver?.givenName ?? "",
                                    familyName: resultMRData.driver?.familyName ?? "",
                                    dateOfBirth: resultMRData.driver?.dateOfBirth ?? "",
                                    nationality: resultMRData.driver?.nationality ?? ""
                                )
                                let constructor = Constructor(
                                    constructorID: resultMRData.constructor?.constructorID ?? "",
                                    url: resultMRData.constructor?.url ?? "",
                                    name: resultMRData.constructor?.name ?? "",
                                    nationality: resultMRData.constructor?.nationality ?? ""
                                )
                                let fastestLapAverageSpeed = AverageSpeed(
                                    units: (resultMRData.fastestLap?.averageSpeed?.units ?? .kph).rawValue,
                                    speed: resultMRData.fastestLap?.averageSpeed?.speed ?? ""
                                )
                                let fastestLap = FastestLap(
                                    rank: resultMRData.fastestLap?.rank ?? "",
                                    lap: resultMRData.fastestLap?.lap ?? "",
                                    time: resultMRData.fastestLap?.time?.time ?? "",
                                    averageSpeed: fastestLapAverageSpeed
                                )
                                let time = Time(
                                    millis: resultMRData.time?.millis ?? "",
                                    time: resultMRData.time?.time ?? ""
                                )
                                
                                let raceResult = RaceResult(
                                    number: resultMRData.number ?? "",
                                    position: resultMRData.position ?? "",
                                    positionText: resultMRData.positionText ?? "",
                                    points: resultMRData.points ?? "",
                                    driver: driver,
                                    constructor: constructor,
                                    grid: resultMRData.grid ?? "",
                                    laps: resultMRData.laps ?? "",
                                    status: resultMRData.status?.stringValue ?? "",
                                    time: time,
                                    fastestLap: fastestLap
                                )
                                firstFiveRaceResults.append(raceResult)
                            }
                        }
                        
                        // Append the first 5 race results to raceResults
                        self?.raceResults.append(contentsOf: firstFiveRaceResults)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func filterRaceID(for raceName: String, from circuitTable: [Circuit]) -> Int? {
        for (index, circuit) in circuitTable.enumerated() {
            if circuit.circuitID == raceName.lowercased() {
                circuitID = index
                
                getRaceResults(raceYear!, index)
            }
        }
        return nil
    }
    
    func convertTimeToSeconds(timeString: String) -> Double {
        let parts = timeString.split(separator: ":").map(String.init)
        guard !parts.isEmpty else { return 0.0 }
        
        var totalSeconds = 0.0
        
        if parts.count > 1 {
            if let minutes = Double(parts[0]) {
                totalSeconds += minutes * 60
            }
        }
        
        let secondsParts = parts.last?.split(separator: ".").map(String.init)
        if let secondsString = secondsParts?.first, let seconds = Double(secondsString) {
            totalSeconds += seconds
        }
        if secondsParts?.count ?? 0 > 1, let millisecondsString = secondsParts?.last, let milliseconds = Double(millisecondsString) {
            totalSeconds += milliseconds / 1000
        }
        
        return totalSeconds
    }
}
