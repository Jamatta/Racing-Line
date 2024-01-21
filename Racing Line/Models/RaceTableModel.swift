//
//  RaceTableModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 22.01.24.
//

import Foundation

// MARK: - RaceTable
struct RaceTable: Decodable {
    let season: String
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}
