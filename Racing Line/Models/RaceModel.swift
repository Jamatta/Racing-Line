//
//  RaceModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 22.01.24.
//

import Foundation

// MARK: - RaceResponse
struct RaceResponse: Decodable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - MRData
struct MRData: Decodable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTable?
    let standingsTable: StandingsTable?
    let circuitTable: CircuitTable?

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
        case standingsTable = "StandingsTable"
        case circuitTable = "CircuitTable"
    }
}


// MARK: - Race
struct Race: Decodable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date, time: String
    let firstPractice, secondPractice: FirstPractice
    let thirdPractice: FirstPractice?
    let qualifying: FirstPractice
    let sprint: FirstPractice?

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
    }
}

// MARK: - FirstPractice
struct FirstPractice: Decodable {
    let date, time: String
}
