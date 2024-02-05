//
//  DriverDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct DriverDetailViewController: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel = DriverDetailViewModel()
    var driverName: String
    
    //MARK: - Body
    var body: some View {
        ScrollView{
            ZStack {
                driverContentView
            }
            .ignoresSafeArea(.all)
            .background(AppColors.background)
        }
        .onAppear {
            viewModel.viewDidLoad(driverName: driverName)
        }
    }
    
    //MARK: - Components
    private var driverContentView: some View {
        VStack(spacing: 40) {
            DriverDetailedViewComponent(
                driverName: viewModel.driver?.name ?? "name",
                driverNumber: viewModel.driver?.number ?? 0,
                driverTeam: viewModel.driver?.teams.first?.team.name ?? "name",
                driverImage: viewModel.driver?.image ?? "default"
            )
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
                    infoText: "\(viewModel.driver?.grandsPrixEntered ?? 0)"
                )
                
                DetailInfoCardView(
                    infoLabel: "🏆 World title",
                    infoText: "\(viewModel.driver?.worldChampionships ?? 0)"
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "🥇 Race wins",
                    infoText: "\(viewModel.driver?.highestRaceFinish.number ?? 0)"
                )
                
                DetailInfoCardView(
                    infoLabel: "🥈 Podiums",
                    infoText: "\(viewModel.driver?.podiums ?? 0)"
                )
            }
        }
    }
    
    private var birthInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Nationality",
                infoText: viewModel.driver?.country.name ?? "country"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Birthday",
                infoText: viewModel.driver?.birthdate ?? "date"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "BirthPlace",
                infoText: viewModel.driver?.birthplace ?? "place"
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
        presentImage()
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: viewModel.driver?.teams.first?.team.logo ?? "placeholder")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 80)
                    .background(AppColors.layer)
                    .cornerRadius(8)
                
            }, placeholder: {
                Image("defaultImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 80)
                    .background(AppColors.layer)
                    .cornerRadius(8)
            })
    }
}

