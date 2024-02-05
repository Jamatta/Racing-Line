//
//  TeamDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 05.02.24.
//

import SwiftUI

struct TeamDetailViewController: View {
    
    //MARK: - Properties
    //@ObservedObject var viewModel = TeamDetailViewModel()
    //var teamName: String
    
    //MARK: - Body
    var body: some View {
        
        VStack{
            teamInfoHeaderContainer
            
            //
            teamInfoStatsContainer
        }
    }
    
    private var teamInfoHeaderContainer: some View {
        HStack {
            teamInfoHeaderLeft
            Spacer()
            teamInfoHeaderRight
        }
        .padding(.leading, 20)
        
        
    }
    
    private var teamInfoHeaderLeft: some View {
        HStack {
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) //TODO: constructorColor
                .frame(width: 3, height: 100)
            VStack(alignment: .leading, spacing: 8) {
                Text("Red Bull")
                    .font(Font.system(size: 22))
                    .fontWeight(.black)
                    .foregroundStyle(AppColors.textPrimary)
                
                presentImage()
                
            }
        }
    }
    
    private var teamInfoHeaderRight: some View {
        Image("red_bull")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 240)
            .scaleEffect(x: -1, y: 1)
            .offset(x: 60)
            .offset(y: 10)
    }
    
    private var teamInfoStatsContainer: some View {
        VStack (spacing: 24){
            teamInfoCardsView
            teamInfoListView
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .background(AppColors.background)
    }
    
    private var teamInfoCardsView: some View {
        VStack {
            HStack {
                DetailInfoCardView(
                    infoLabel: "Stats",
                    infoText: "Stats"
                )
                
                DetailInfoCardView(
                    infoLabel: "Stats",
                    infoText: "Stats"
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "Stats",
                    infoText: "Stats"
                )
                
                DetailInfoCardView(
                    infoLabel: "Stats",
                    infoText: "Stats"
                )
            }
        }
    }
    
    private var teamInfoListView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Stats",
                infoText: "Stats"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Stats",
                infoText: "Stats"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Stats",
                infoText: "Stats"
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
    
    
    //    private var teamInfoDrivers: some View {
    //
    //    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: "alonso")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                
            }, placeholder: {
                Image("alonso")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            })
    }
}

#Preview {
    TeamDetailViewController()
}
