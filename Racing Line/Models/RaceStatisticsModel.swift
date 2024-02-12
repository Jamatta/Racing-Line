//
//  RaceStatisticsModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import Foundation

//MARK: - RaceStatisticsResponse
struct RaceStatisticsResponse: Decodable {
    let mrData: RaceStatisticsMRData?

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

//MARK: - RaceStatisticsMRData
struct RaceStatisticsMRData: Decodable {
    let xmlns: String?
    let series: String?
    let url: String?
    let limit, offset, total: String?
    let circuitTable: RaceTableMRData?

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case circuitTable = "RaceTable"
    }
}

//MARK: - RaceTableMRData
struct RaceTableMRData: Decodable {
    let season, round: String?
    let races: [RaceMRData]?

    enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

//MARK: - RaceMRData
struct RaceMRData: Decodable {
    let season, round: String?
    let url: String?
    let raceName: String?
    let circuit: CircuitMRData?
    let date, time: String?
    let results: [ResultMRData]?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case results = "Results"
    }
}

//MARK: - CircuitMRData
struct CircuitMRData: Decodable {
    let circuitID: String?
    let url: String?
    let circuitName: String?
    let location: LocationMRData?

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

//MARK: - LocationMRData
struct LocationMRData: Decodable {
    let lat, long, locality, country: String?
}

//MARK: - ResultMRData
struct ResultMRData: Decodable {
    let number, position, positionText, points: String?
    let driver: DriverMRData?
    let constructor: ConstructorMRData?
    let grid, laps: String?
    let status: StatusMRData?
    let time: ResultTimeMRData?
    let fastestLap: FastestLapMRData?

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

//MARK: - ConstructorMRData
struct ConstructorMRData: Decodable {
    let constructorID: String?
    let url: String?
    let name, nationality: String?

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

//MARK: - DriverMRData
struct DriverMRData: Decodable {
    let driverID, permanentNumber, code: String?
    let url: String?
    let givenName, familyName, dateOfBirth, nationality: String?

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

//MARK: - FastestLapMRData
struct FastestLapMRData: Decodable {
    let rank, lap: String?
    let time: FastestLapTimeMRData?
    let averageSpeed: AverageSpeedMRData?

    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

//MARK: - AverageSpeedMRData
struct AverageSpeedMRData: Decodable {
    let units: Units?
    let speed: String?
}

enum Units: String, Decodable {
    case kph = "kph"
}

//MARK: - FastestLapTimeMRData
struct FastestLapTimeMRData: Decodable {
    let time: String?
}


//MARK: - ResultTimeMRData
struct ResultTimeMRData: Decodable {
    let millis, time: String?
}

enum StatusMRData: Decodable {
    case collisionDamage
    case finished
    case rearWing
    case the1Lap
    case unknown(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let status = try container.decode(String.self)

        switch status {
        case "Collision damage":
            self = .collisionDamage
        case "Finished":
            self = .finished
        case "Rear wing":
            self = .rearWing
        case "+1 Lap":
            self = .the1Lap
        default:
            self = .unknown(status)
        }
    }
    
    var stringValue: String {
        switch self {
        case .collisionDamage:
            return "Collision damage"
        case .finished:
            return "Finished"
        case .rearWing:
            return "Rear wing"
        case .the1Lap:
            return "+1 Lap"
        case .unknown(let status):
            return status
        }
    }
}
