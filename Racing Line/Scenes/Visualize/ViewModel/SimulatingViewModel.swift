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
    var raceResults = [RaceResult]()
    
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
        
        networkManager.request(with: urlString) { [weak self] (result: Result<RaceResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let response = data.mrData.raceTable?.races.first?.results else {
                        return
                    }
                    self?.raceResults.append(contentsOf: response.self)
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
}
