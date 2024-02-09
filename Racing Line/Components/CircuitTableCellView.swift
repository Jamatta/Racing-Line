//
//  CircuitTableCellView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 07.02.24.
//

import SwiftUI

struct CircuitTableCellView: View {
    
    //MARK: - Properties
    var circuit: Circuit
    
    //MARK: - Body
    var body: some View {
        cellContainerView
    }
    //MARK: - Components
    
    private var circuitMainInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(circuit.location.country)
                .foregroundStyle(AppColors.textPrimary)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(circuit.circuitName)
                .foregroundStyle(AppColors.textSecondary)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .frame(minWidth: 148)
    }
    
    private var circuitImageView: some View {
        Image(circuit.circuitID)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 48)
            .cornerRadius(4)
    }
    
    private var contentView: some View {
        HStack(spacing: 12) {
            circuitMainInfoView
            Spacer()
            circuitImageView
        }
    }
    
    private var cellContainerView: some View {
        HStack(spacing: 20) {
           // dateInfoView
            contentView
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
    }
}
