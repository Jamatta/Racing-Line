//
//  CircuitCardView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 09.02.24.
//

import SwiftUI

struct CircuitCardView: View {
    
    //MARK: - Properties
    var name: String
    var location: String
    var description: String
    var imageName: String
    
    //MARK: - Body
    var body: some View {
        circuitCardContainerView
    }
    
    private var circuitCardContainerView: some View {
        ZStack(alignment: .bottom) {
            backgroundImageView
            descriptionView
            bottomLabelBackgroundView
            bottomInfoView
        }
        .frame(maxHeight: 320)
        .padding(20)
    }
    
    private var backgroundImageView: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .cornerRadius(12)
    }
    
    private var descriptionView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(description)
                    .font(Font.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
            }
            Spacer()
            
        }
        .padding(.vertical, 12)
        .padding(.top, 56)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [AppColors.textPrimary.opacity(0), AppColors.textPrimary.opacity(0.8)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .padding(.bottom, 68)
    }
    
    private var bottomLabelBackgroundView: some View {
        Image(imageName)
            .resizable()
            .offset(x: 0, y: -100)
            .aspectRatio(contentMode: .fill)
            .frame(height: 68)
            .blur(radius: 20)
            .clipped()
            .clipShape(BottomCornerRadius(radius: 12))
    }
    
    private var bottomInfoView: some View {
        HStack {
            circuitInfoView
            Spacer()
            simulateButtonView
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .background(AppColors.textPrimary.opacity(0.56))
        .clipShape(BottomCornerRadius(radius: 12))
    }
    
    private var circuitInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(Font.system(size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(location)
                .font(Font.system(size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.white)
        }
    }
    
    private var simulateButtonView: some View {
        HStack {
            Text("Simulation")
                .font(Font.system(size: 12))
                .fontWeight(.regular)
                .foregroundStyle(.white)
            Image(systemName: "play.circle.fill")
                .foregroundColor(.white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(AppColors.layer.opacity(0.08))
        .cornerRadius(6)
    }
}

struct BottomCornerRadius: Shape {
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.closeSubpath()

        return path
    }
}

#Preview {
    CircuitCardView(
        name: "Spa",
        location: "Belgium",
        description: "Descritpion text goes here",
        imageName: "spabg"
    )
}
