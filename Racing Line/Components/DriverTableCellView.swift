//
//  DriverTableCellView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 24.01.24.
//

import SwiftUI

struct DriverTableCellView: View {
    
    var driverStanding: DriverStanding
    
    var body: some View {
        HStack(spacing: 10) {
            
            Image(driverStanding.driver.driverID)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .background(ConstructorColor.getColor(for: driverStanding.constructors.first!.constructorID).opacity(0.12))
                .cornerRadius(24)
                
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(driverStanding.driver.givenName)
                        .font(.caption)
                        .foregroundStyle(AppColors.textSecondary)
                    Text(driverStanding.driver.familyName)
                        .bold()
                        .foregroundStyle(AppColors.textPrimary)
                    
                }
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text("#\(driverStanding.driver.permanentNumber)")
                        .font(.caption)
                        .foregroundStyle(ConstructorColor.getColor(for: driverStanding.constructors.first!.constructorID))
                    Text(driverStanding.constructors.first!.name)
                        .foregroundStyle(ConstructorColor.getColor(for: driverStanding.constructors.first!.constructorID))
                    
                }
                
            }
        }
    }
}
