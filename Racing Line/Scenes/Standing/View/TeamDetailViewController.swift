//
//  TeamDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 05.02.24.
//

import SwiftUI

struct TeamDetailViewController: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel = TeamDetailViewModel()
    var teamName: String
    
    //MARK: - Body
    var body: some View {
        
        ScrollView {
            VStack{
                teamInfoHeaderContainer
                teamInfoStatsContainer
            }
            .ignoresSafeArea(.all)
            .background(AppColors.background)
        }
        .onAppear {
            viewModel.viewDidLoad(teamName: teamName)
        }
        
    }
    
    //MARK: - Components
    private var teamInfoHeaderContainer: some View {
        HStack {
            teamInfoHeaderLeft
            Spacer()
            teamInfoHeaderRight
        }
        .padding(.leading, 20)
        .padding(.top, 20)
        
        
    }
    
    private var teamInfoHeaderLeft: some View {
        HStack {
            Rectangle()
                .foregroundColor(ConstructorColor.getColor(for: viewModel.convertToSnakeCase(name: teamName)))
                .frame(width: 3, height: 80)
            VStack(alignment: .leading, spacing: 0) {
                Text(teamName)
                    .font(Font.system(size: 18))
                    .fontWeight(.black)
                    .foregroundStyle(AppColors.textPrimary)
                
                presentImage()
            }
            .padding(.vertical, 12)
        }
    }
    
    private var teamInfoHeaderRight: some View {
        Image(viewModel.convertToSnakeCase(name: teamName))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
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
                    infoLabel: "World title",
                    infoText: String(viewModel.team?.worldChampionships ?? 0)
                )
                
                DetailInfoCardView(
                    infoLabel: "Race wins",
                    infoText: String(viewModel.team?.highestRaceFinish?.number ?? 0)
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "Pole positions",
                    infoText: String(viewModel.team?.polePositions ?? 0)
                )
                
                DetailInfoCardView(
                    infoLabel: "Fastest laps",
                    infoText: String(viewModel.team?.fastestLaps ?? 0)
                )
            }
        }
    }
    
    private var teamInfoListView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Base",
                infoText: viewModel.team?.base ?? "-"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "President",
                infoText: viewModel.team?.president ?? "-"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Director",
                infoText: viewModel.team?.director ?? "-"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Technical meneger",
                infoText: viewModel.team?.technicalManager ?? "-"
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
    
    //MARK: - Methods
    private func presentImage() -> some View {
        let imageURL = URL(string: viewModel.team?.logo ?? "placeholder")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                
            }, placeholder: {
                Image("default")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            })
    }
}
