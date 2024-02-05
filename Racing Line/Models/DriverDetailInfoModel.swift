//
//  DriverDetailInfoModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 05.02.24.
//

import Foundation

import Foundation

// MARK: - DriverDetailResponse
struct DriverDetailResponse: Decodable {
    let get: String
    let parameters: DriverParameters
    let results: Int
    let response: [DriverDetail]
    
    enum CodingKeys: String, CodingKey {
        case get, parameters, results, response
    }
}

// MARK: - DriverParameters
struct DriverParameters: Decodable {
    let search: String
}

// MARK: - DriverDetail
struct DriverDetail: Decodable {
    let id: Int
    let name, abbr, image, nationality: String
    let country: Country
    let birthdate, birthplace: String
    let number: Int
    let grandsPrixEntered: Int
    let worldChampionships: Int
    let podiums: Int
    let highestRaceFinish: HighestRaceFinish
    let highestGridPosition: Int
    let careerPoints: String
    let teams: [DriverTeam]
    
    enum CodingKeys: String, CodingKey {
        case id, name, abbr, image, nationality, country, birthdate, birthplace, number, teams
        case grandsPrixEntered = "grands_prix_entered"
        case worldChampionships = "world_championships"
        case podiums
        case highestRaceFinish = "highest_race_finish"
        case highestGridPosition = "highest_grid_position"
        case careerPoints = "career_points"
    }
}

// MARK: - Country
struct Country: Decodable {
    let name, code: String
}

// MARK: - HighestRaceFinish
struct HighestRaceFinish: Decodable {
    let position, number: Int
}

// MARK: - DriverTeam
struct DriverTeam: Decodable {
    let season: Int
    let team: Team
}

// MARK: - Team
struct Team: Decodable {
    let id: Int
    let name, logo: String
}

