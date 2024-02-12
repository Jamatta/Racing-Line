//
//  SimulatingFilterView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct SimulatingFilterView: View {
    
    @ObservedObject var viewModel = SimulatingViewModel()
    @State private var selectedYear: RacingYear = .year2023
    @State private var isSimulatingViewPresented = false
    var selectedCircuit: CircuitData
    
    var body: some View {
        VStack {
            headerContentView
            yearPickerView
            buttonView
        }
        .background(AppColors.background)
    }
    
    private var headerContentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            imageView
            VStack(alignment: .leading, spacing: 6) {
                titleView
                subTitleView
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var imageView: some View {
        Image(selectedCircuit.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
    }
    
    private var titleView: some View {
        Text(selectedCircuit.name)
            .font(Font.system(size: 22))
            .fontWeight(.semibold)
            .foregroundStyle(AppColors.textPrimary)
    }
    
    private var subTitleView: some View {
        Text(selectedCircuit.location)
            .font(Font.system(size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(AppColors.textSecondary)
    }
    
    private var yearPickerView: some View {
        List {
            Picker("Select year", selection: $selectedYear) {
                ForEach(RacingYear.allCases, id: \.self) { year in
                    Text("\(year.rawValue)").tag(year)
                }
            }
            .onChange(of: selectedYear) { newValue in
                selectedYear = newValue
            }
        }
        .background(AppColors.background)
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
    
    private var buttonView: some View {
        Button("Start simulation") {
            isSimulatingViewPresented = true
            print("Selected - \(selectedCircuit.name)")
            viewModel.raceName = selectedCircuit.name
            viewModel.viewDidLoad(raceYear: String(selectedYear.rawValue))
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .foregroundColor(AppColors.textPrimary)
        .background(AppColors.accentColor)
        .cornerRadius(8)
        .fullScreenCover(isPresented: $isSimulatingViewPresented, content: {
            SimulatingView(
                circuitShape: selectedCircuit.circuitShape,
                selectedYear: selectedYear.rawValue
            ) {
                isSimulatingViewPresented = false
            }
        })
        .padding(.horizontal, 20)
    }
}

enum RacingYear: Int, CaseIterable, Identifiable {
    case year2010 = 2010
    case year2011 = 2011
    case year2012 = 2012
    case year2013 = 2013
    case year2014 = 2014
    case year2015 = 2015
    case year2016 = 2016
    case year2017 = 2017
    case year2018 = 2018
    case year2019 = 2019
    case year2020 = 2020
    case year2021 = 2021
    case year2022 = 2022
    case year2023 = 2023
    
    var id: Int { rawValue }
}

