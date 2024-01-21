//
//  RacingTableCellView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 22.01.24.
//

import SwiftUI

struct RacingTableCellView: View {
    
    //MARK: - Properties
    var race: Race
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 20) {
            dateInfoView
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(race.circuit.location.country)
                            .bold()
                            .foregroundStyle(AppColors.textPrimary)
                        Spacer()
                        Text("ROUND \(race.round)")
                            .font(.caption)
                            .foregroundStyle(AppColors.accentColor)
                    }
                    
                    Text(race.circuit.circuitName)
                        .foregroundStyle(AppColors.textSecondary)
                        .font(.caption)
                }
                
                Image(race.circuit.location.country)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 48)
                    .cornerRadius(4)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .background(AppColors.layer)
    }
    
    private var dateInfoView: some View {
        VStack(alignment: .center, spacing: 4) {
            dateView
            monthView
        }
    }
    
    private var dateView: some View {
        Text(race.date)
            .foregroundStyle(AppColors.textSecondary)
            .font(.caption)
    }
    
    private var monthView: some View {
        Text(race.date)
            .foregroundStyle(AppColors.textPrimary)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(AppColors.gray)
            .cornerRadius(6)
    }
}
