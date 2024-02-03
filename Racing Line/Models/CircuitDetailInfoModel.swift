//
//  CircuitDetailInfoModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 03.02.24.
//

import Foundation

// MARK: - CircuitDetailResponse
struct CircuitDetailResponse: Decodable {
    let get: String
    let parameters: Parameters
    let errors: [String]
    let results: Int
    let response: [CircuitDetail]

    enum CodingKeys: String, CodingKey {
        case get, parameters, errors, results, response
    }
}

// MARK: - Parameters
struct Parameters: Decodable {
    let id: String?
}

// MARK: - CircuitDetail
struct CircuitDetail: Decodable {
    let id: Int
    let name: String
    let image: String
    let competition: Competition
    let firstGrandPrix: Int
    let laps: Int
    let length, raceDistance: String
    let lapRecord: LapRecord
    let capacity, opened: Int
    let owner: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, competition, laps, length, capacity, opened, owner
        case firstGrandPrix = "first_grand_prix"
        case raceDistance = "race_distance"
        case lapRecord = "lap_record"
    }
}

// MARK: - Competition
struct Competition: Decodable {
    let id: Int
    let name: String
    let location: CircuitLocation
}

// MARK: - Location
struct CircuitLocation: Decodable {
    let country, city: String
}

// MARK: - LapRecord
struct LapRecord: Decodable {
    let time, driver: String?
    let year: String
}
