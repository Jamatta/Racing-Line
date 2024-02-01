//
//  DriverDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct DriverDetailViewController: View {
    var body: some View {
        
        VStack(spacing: 40) {
            DriverDetailedViewComponent()
                .padding(.top, 40)
                .background(AppColors.background)
            
            VStack(spacing: 40) {
                statsSectionInfoView
                birthSectionInfoView
                teamsInfoView
            }
        }
    }
    
    private var statsSectionInfoView: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            statsInfoView
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    private var birthSectionInfoView: some View {
        HStack  {
            VStack(alignment: .leading, spacing: 12) {
                birthInfoView
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    private var statsInfoView: some View {
        VStack {
            HStack {
                DriverInfoSectionComponent(
                    infoLabel: "🏁 Races",
                    infoText: "185"
                )
                
                DriverInfoSectionComponent(
                    infoLabel: "🏆 World title",
                    infoText: "3"
                )
            }
            
            HStack {
                DriverInfoSectionComponent(
                    infoLabel: "🥇 Race wins",
                    infoText: "54"
                )
                
                DriverInfoSectionComponent(
                    infoLabel: "🥈 Podiums",
                    infoText: "98"
                )
            }
        }
    }
    
    private var birthInfoView: some View {
        VStack(alignment: .leading, spacing: 12) {
            BioListComponent(
                infoLabel: "nationality",
                infoText: "Dutch"
            )
            
            BioListComponent(
                infoLabel: "birthday",
                infoText: "1997-09-30"
            )
            
            BioListComponent(
                infoLabel: "birthPlace",
                infoText: "Hasselt, Belgium"
            )
        }
        
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
            .background(AppColors.background)
            .cornerRadius(8)
    }
}

#Preview {
    DriverDetailViewController()
}

