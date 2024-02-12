//
//  DriverProgressView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct DriverProgressView: View {
    
    //MARK: - Properties
    @State private var Progress: CGFloat = 0.0
    @State private var currentLap: Int = 0
    let dotLength: CGFloat = 0.0001
    var endPosition: CGFloat {
        return 1
    }
    
    var fastestLap: Double
    var laps: Int
    var color: Color
    var circuitShape: AnyShape
    
    //MARK: - Body
    var body: some View {
        ZStack {
            circuitShape
                .trim(from: Progress, to: min(Progress + dotLength, endPosition))
                .stroke(LinearGradient(gradient: Gradient(colors: [color]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            animate()
        }
    }
    
    //MARK: - Methods
    private func animate() {
        if currentLap < laps {
            
            DispatchQueue.main.async {
                withAnimation(.linear(duration: fastestLap)) {
                    Progress = endPosition
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + fastestLap) {
                    Progress = 0
                    currentLap += 1
                    animate()
                }
            }
        }
    }
}
