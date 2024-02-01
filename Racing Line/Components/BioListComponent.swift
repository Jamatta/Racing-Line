//
//  BioListComponent.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct BioListComponent: View {
    
    //MARK: - Properties
    var infoLabel: String
    var infoText: String
    
    //MARK: - Body
    var body: some View {
        bioListView
    }
    
    //MARK: - Components
    private var bioListView: some View {
        VStack(alignment: .leading) {
            Text(infoLabel)
                .font(Font.system(size: 14))
                .foregroundStyle(AppColors.textSecondary)
                .padding(.horizontal, 2)
                .background(AppColors.background)
            
            Text(infoText)
                .font(Font.system(size: 18))
                .fontWeight(.black)
                .foregroundStyle(AppColors.textPrimary)
            
        }
    }
}


