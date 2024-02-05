//
//  TeamDetailInfoModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 06.02.24.
//

import Foundation

// MARK: - TeamResponse
struct TeamResponse: Decodable {
    let get: String
    let parameters: TeamParameters
    let results: Int
    let response: [TeamDetail]
    
    enum CodingKeys: String, CodingKey {
        case get, parameters, results, response
    }
}

// MARK: - TeamParameters
struct TeamParameters: Decodable {
    let search: String
}

// MARK: - TeamDetail
struct TeamDetail: Decodable {
    let id: Int
    let name: String
    let logo: String
    let base: String
    let firstTeamEntry: Int
    let worldChampionships: Int
    let highestRaceFinish: TeamHighestRaceFinish?
    let polePositions: Int
    let fastestLaps: Int
    let president: String
    let director: String
    let technicalManager: String
    let chassis: String
    let engine: String
    let tyres: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, logo, base, president, director, chassis, engine, tyres

        case firstTeamEntry = "first_team_entry"
        case worldChampionships = "world_championships"
        case highestRaceFinish = "highest_race_finish"
        case polePositions = "pole_positions"
        case fastestLaps = "fastest_laps"
        case technicalManager = "technical_manager"
    }
}

// MARK: - HighestRaceFinish
struct TeamHighestRaceFinish: Decodable {
    let position, number: Int
}
