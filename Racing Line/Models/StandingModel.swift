//
//  StandingModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 23.01.24.
//

import Foundation

// MARK: - Welcome
struct StandingResponse: Decodable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - StandingsTable
struct StandingsTable: Decodable {
    let season: String
    let standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

// MARK: - StandingsList
struct StandingsList: Decodable {
    let season, round: String
    let driverStandings: [DriverStanding]?
    let constructorStandings: [ConstructorStanding]?

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
        case constructorStandings = "ConstructorStandings"
    }
}

// MARK: - DriverStanding
struct DriverStanding: Decodable {
    let position, positionText, points, wins: String
    let driver: Driver
    let constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

// MARK: - Constructor
struct Constructor: Decodable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

// MARK: - Driver
struct Driver: Decodable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

// MARK: - ConstructorStanding
struct ConstructorStanding: Decodable {
    let position, positionText, points, wins: String
    let constructor: Constructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}
