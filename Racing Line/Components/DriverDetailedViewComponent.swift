//
//  DriverDetailedViewComponent.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 29.01.24.
//

import SwiftUI

struct DriverDetailedViewComponent: View {
    
    //MARK: - Properties
    var driverName: String
    var driverNumber: Int
    var driverTeam: String
    var driverImage: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            driverInfoContainerView
            Spacer()
            driverImageView
        }
        .padding(.horizontal, 20)
    }
    
    //MARK: - Components
    private var driverImageView: some View {
        presentImage()
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: driverImage)
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                
            }, placeholder: {
                Image("defaultImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
            })
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
            Text(driverName)
                .font(Font.system(size: 22))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
        }
    }
    
    private var driverMajorDetailsView: some View {
        HStack {
            Text("\(driverNumber)")
                .font(Font.system(size: 18))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
            Text("/")
            Text(driverTeam)
        }
        .font(Font.system(size: 16))
        .fontWeight(.semibold)
        .foregroundStyle(AppColors.textSecondary)
    }
}

