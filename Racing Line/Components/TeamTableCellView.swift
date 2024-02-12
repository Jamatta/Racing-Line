//
//  TeamTableCellView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 30.01.24.
//

import SwiftUI

struct TeamTableCellView: View {
    
    //MARK: - Properties
    var teamStanding: ConstructorStanding
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text(teamStanding.constructor.name)
                .bold()
                .foregroundStyle(AppColors.textPrimary)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 48, height: 12)
                    .foregroundColor(ConstructorColor.getColor(for: teamStanding.constructor.constructorID))
                    .padding(.trailing, 100)
                
                Image(teamStanding.constructor.constructorID)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)
                    .padding(.trailing, 0)
            }
        }
    }
}
