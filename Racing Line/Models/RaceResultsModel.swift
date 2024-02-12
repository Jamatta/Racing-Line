//
//  RaceResultsModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import Foundation

// MARK: - RaceResult
struct RaceResult: Decodable {
    let number, position, positionText, points: String?
    let driver: Driver?
    let constructor: Constructor?
    let grid, laps, status: String?
    let time: Time?
    let fastestLap: FastestLap?

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points, driver, constructor, grid, laps, status, time, fastestLap
    }
}

// MARK: - FastestLap
struct FastestLap: Decodable {
    let rank, lap: String
    let time: String
    let averageSpeed: AverageSpeed

    enum CodingKeys: String, CodingKey {
        case rank, lap, time
        case averageSpeed = "AverageSpeed"
    }
}

// MARK: - AverageSpeed
struct AverageSpeed: Decodable {
    let units, speed: String

    enum CodingKeys: String, CodingKey {
        case units = "units"
        case speed = "speed"
    }
}

// MARK: - Time
struct Time: Decodable {
    let millis, time: String?

    enum CodingKeys: String, CodingKey {
        case millis = "millis"
        case time = "time"
    }
}
