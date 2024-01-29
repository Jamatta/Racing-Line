//
//  TeamTableCellView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 30.01.24.
//

import SwiftUI

struct TeamTableCellView: View {
    
    var teamStanding: ConstructorStanding
    var body: some View {
        Text(teamStanding.constructor.name)
    }
}
