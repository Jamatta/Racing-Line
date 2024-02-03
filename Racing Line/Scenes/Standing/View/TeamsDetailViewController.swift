//
//  TeamsDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 03.02.24.
//

import SwiftUI

struct TeamsDetailViewController: View {
    var body: some View {
        teamContentHeader
        
        VStack (spacing: 40) {
            
            teamInfoCardView
            
            teamInfoListView
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20) //TODO:  remove
        .background(AppColors.background)
       
    }
    
    private var teamContentHeader: some View {
        HStack {
            teamContentHeaderLeft
            Spacer()
            teamContentHeaderRight
        }
        .padding(.leading, 20)
    }
    
    private var teamContentHeaderLeft: some View {
        HStack {
            Rectangle()
                .frame(width: 3, height: 92)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            VStack (alignment: .leading, spacing: 8) {
                Text("Red Bull racing")
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundStyle(AppColors.textPrimary)
                Image("")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .aspectRatio(contentMode: .fill)
                    .background(AppColors.gray)
            }
        }
    }
    
    private var teamContentHeaderRight: some View {
        Image("red_bull")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(x: -80)
            .scaleEffect(x: -1, y: 1)
    }
    
    private var teamInfoCardView: some View {
        VStack {
            HStack {
                DetailInfoCardView(
                    infoLabel: "World Titles", //hardcode
                    infoText: "4"
                )
                
                DetailInfoCardView(
                    infoLabel: "Race Wins", //hardcode
                    infoText: "75"
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "Pole Positions", //hardcode
                    infoText: "73"
                )
                
                DetailInfoCardView(
                    infoLabel: "Fastest Lap", //hardcode
                    infoText: "76"
                )
            }
        }
    }
    
    private var teamInfoListView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Base", //hardcode
                infoText: "Milton Keynes, United Kingdom"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "President", //hardcode
                infoText: "Dietrich Mateschitz"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Director", //hardcode
                infoText: "Christian Horner"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Technival Manager", //hardcode
                infoText: "Pierre Waché"
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
}

#Preview {
    TeamsDetailViewController()
}
