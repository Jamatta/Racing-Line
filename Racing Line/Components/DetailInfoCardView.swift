//
//  DetailInfoCardView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct DetailInfoCardView: View {
    
    //MARK: - Properties
    var infoLabel: String
    var infoText: String
    
    //MARK: - Body
    var body: some View {
        infoSectionView
    }
    
    //MARK: - Components
    private var infoSectionView: some View {
        VStack(spacing: 8) {
            Text(infoText)
                .font(Font.system(size: 18))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
            
            Text(infoLabel)
                .font(Font.system(size: 14))
                .foregroundStyle(AppColors.textSecondary)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .padding(.vertical, 12)
        .background(AppColors.layer)
        .cornerRadius(8)
        
    }
}
