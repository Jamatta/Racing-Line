//
//  DriverDetailedViewComponent.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 29.01.24.
//

import SwiftUI

struct DriverDetailedViewComponent: View {
    var body: some View {
        HStack {
            driverInfoContainerView
            Spacer()
            driverImageView
        }
        .padding(.horizontal, 20)
    }
    
    private var driverImageView: some View {
        Image("max_verstappen")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 140, height: 140)
    }
    
    private var driverInfoContainerView: some View {
        HStack(spacing: 10) {
            rectangeView
            
            VStack(alignment: .leading, spacing: 10) {
                driverNameView
                driverMajorDetailsView
            }
        }
    }
    
    private var rectangeView: some View {
        Rectangle()
            .frame(width: 4, height: 88)
            .foregroundColor(.blue) //ConstructorColor.getColor(for: )
    }
    
    private var driverNameView: some View {
        VStack(alignment: .leading) {
            Text("Max")
                .font(Font.system(size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textPrimary)
            Text("Verstappen")
                .font(Font.system(size: 24))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
        }
    }
    
    private var driverMajorDetailsView: some View {
        HStack {
            Text("1")
                .font(Font.system(size: 20))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
            Text("/")
            Text("Red Bull Racing")
        }
        .font(Font.system(size: 20))
        .fontWeight(.semibold)
        .foregroundStyle(AppColors.textSecondary)
    }
}

#Preview {
    DriverDetailedViewComponent()
}
