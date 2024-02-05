//
//  CircuitDetailViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 02.02.24.
//

import SwiftUI

struct CircuitDetailViewController: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel = CircuitDetailViewModel()
    var circuitName: String
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            circuitContentView
        }
        .onAppear {
            viewModel.viewDidLoad(circuitId: circuitName)
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
        presentImage()
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: viewModel.circuit?.image ?? "placeholder")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 260)
                
            }, placeholder: {
                Image("defaultImage")
                    .resizable()
                    .cornerRadius(6)
                    .frame(width: 100, height: 140)
                    .scaledToFit()
            })
    }
    
    private var circuitTitleView: some View {
        Text(viewModel.circuit?.name ?? "circuit name")
            .font(Font.system(size: 20))
            .fontWeight(.bold)
            .foregroundStyle(AppColors.textPrimary)
    }
    
    private var circuitInfoView: some View {
        VStack {
            HStack {
                DetailInfoCardView(
                    infoLabel: "Laps",
                    infoText: String(viewModel.circuit?.laps ?? 0)
                )
                
                DetailInfoCardView(
                    infoLabel: "Length",
                    infoText: viewModel.circuit?.length ?? "length"
                )
            }
            
            HStack {
                DetailInfoCardView(
                    infoLabel: "Distance",
                    infoText: viewModel.circuit?.raceDistance ?? "distance"
                )
            }
        }
    }
    
    private var hotLapInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            DetailInfoListView(
                infoLabel: "Fastest lap",
                infoText: viewModel.circuit?.lapRecord.time ?? "time"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Driver",
                infoText: viewModel.circuit?.lapRecord.driver ?? "driver"
            )
            
            Rectangle()
                .foregroundColor(AppColors.background)
                .frame(height: 1)
            
            DetailInfoListView(
                infoLabel: "Year",
                infoText: viewModel.circuit?.lapRecord.year ?? "year"
            )
        }
        .background(AppColors.layer)
        .cornerRadius(8)
    }
}

