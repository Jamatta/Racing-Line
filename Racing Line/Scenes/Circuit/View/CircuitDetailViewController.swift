//
//  CircuitDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 02.02.24.
//

import SwiftUI

struct CircuitDetailViewController: View {
    
    //MARK: - Properties
    var circuit: CircuitDetail
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            circuitContentView
        }
    }
    
    //MARK: - Components
    private var circuitContentView: some View {
        VStack(spacing: 40) {
            circuitHeaderView
            VStack(spacing: 40) {
                circuitInfoView
                hotLapInfoView
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 40)
            .padding(.bottom, 40)
            .background(AppColors.background)
        }
    }
    
    private var circuitHeaderView: some View {
        VStack {
            circuitImageView
            circuitTitleView
        }
    }
    
    private var circuitImageView: some View {
        Image("albert")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 280)
    }
    
    private var circuitTitleView: some View {
        Text(circuit.name)
            .font(Font.system(size: 20))
            .fontWeight(.bold)
            .foregroundStyle(AppColors.textPrimary)
    }
    
    private var circuitInfoView: some View {
        VStack {
            HStack {
                DetailInfoCardView(
                    infoLabel: "Laps",
                    infoText: String(circuit.laps)
                )
                
                DetailInfoCardView(
                    infoLabel: "Length",
                    infoText: String(circuit.length)
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "Distance",
                    infoText: circuit.raceDistance
                )
            }
        }
    }
    
    private var hotLapInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Fastest lap",
                infoText: circuit.lapRecord.time ?? "time"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Driver",
                infoText: circuit.lapRecord.driver ?? "driver"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Year",
                infoText: circuit.lapRecord.year
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
}

