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
        cellContainerView
    }
    //MARK: - Components
    private var dateInfoView: some View {
        VStack(alignment: .center, spacing: 6) {
            roundView
            monthView
        }
    }
    
    private var roundView: some View {
        Text("ROUND \(race.round)")
            .font(.caption)
            .foregroundStyle(AppColors.accentColor)
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
    
    private var circuitMainInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(race.circuit.location.country)
                .foregroundStyle(AppColors.textPrimary)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(race.circuit.circuitName)
                .foregroundStyle(AppColors.textSecondary)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .frame(minWidth: 148)
    }
    
    private var circuitImageView: some View {
        Image(race.circuit.circuitID)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 48)
            .cornerRadius(4)
    }
    
    private var contentView: some View {
        HStack(spacing: 12) {
            circuitMainInfoView
            Spacer()
            circuitImageView
        }
    }
    
    private var cellContainerView: some View {
        HStack(spacing: 20) {
            dateInfoView
            contentView
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(AppColors.layer)
    }
}
