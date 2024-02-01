//
//  DriverDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct DriverDetailViewController: View {
    var body: some View {
        ZStack {
            driverContentView
        }
        .ignoresSafeArea(.all)
        .background(AppColors.background)
    }
    
    private var driverContentView: some View {
        VStack(spacing: 40) {
            DriverDetailedViewComponent()
                .padding(.top, 40)
                .background(AppColors.layer)
            
            VStack(spacing: 40) {
                statsSectionInfoView
                birthSectionInfoView
                teamsInfoView
            }
        }
        .padding(.bottom, 40)
    }
    
    private var statsSectionInfoView: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            statsInfoView
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    private var birthSectionInfoView: some View {
        HStack {
            birthInfoView
        }
        .padding(.horizontal, 20)
    }
    
    private var statsInfoView: some View {
        VStack {
            HStack {
                DetailInfoCardView(
                    infoLabel: "🏁 Races",
                    infoText: "185"
                )
                
                DetailInfoCardView(
                    infoLabel: "🏆 World title",
                    infoText: "3"
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "🥇 Race wins",
                    infoText: "54"
                )
                
                DetailInfoCardView(
                    infoLabel: "🥈 Podiums",
                    infoText: "98"
                )
            }
        }
    }
    
    private var birthInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Nationality",
                infoText: "Dutch"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Birthday",
                infoText: "1997-09-30"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "BirthPlace",
                infoText: "Hasselt, Belgium"
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
    
    private var teamsInfoView: some View {
        HStack(spacing: 8) {
            teamImageView
            teamImageView
        }
    }
    
    private var teamImageView: some View {
        Image("leclerc")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 110, height: 80)
            .background(AppColors.layer)
            .cornerRadius(8)
    }
}

#Preview {
    DriverDetailViewController()
}

