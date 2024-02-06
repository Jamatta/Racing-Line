//
//  CircuitModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 22.01.24.
//

import Foundation

// MARK: - CircuitTable
struct CircuitTable: Decodable {
    let circuits: [Circuit]

    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

// MARK: - Circuit
struct Circuit: Decodable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

// MARK: - Location
struct Location: Decodable {
    let lat, long, locality, country: String
}
