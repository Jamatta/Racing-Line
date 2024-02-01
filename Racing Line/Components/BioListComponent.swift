//
//  BioListComponent.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 01.02.24.
//

import SwiftUI

struct BioListComponent: View {
    
    //MARK: - Properties
    var infoLabel: String = "ცანგალა"
    var infoText: String = "გოგონა"
    
    //MARK: - Body
    var body: some View {
        bioListView
    }
    
    //MARK: - Components
    private var bioListView: some View {
        HStack {
            Text(infoLabel)
                .font(Font.system(size: 14))
                .foregroundStyle(AppColors.textSecondary)
            
            Spacer()
            
            Text(infoText)
                .font(Font.system(size: 16))
                .fontWeight(.bold)
                .foregroundStyle(AppColors.textPrimary)
            
        }
        .cornerRadius(8)
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .background(AppColors.layer)
    }
}

#Preview {
        BioListComponent()
    
}

