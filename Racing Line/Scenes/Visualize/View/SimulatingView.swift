//
//  SimulatingView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct SimulatingView: View {
    
    @ObservedObject var viewModel = SimulatingViewModel()
    var circuitShape: AnyShape
    var selectedYear: Int
    
    var dismissAction: () -> Void
    
    let dotLength: CGFloat = 0.0001
    let lapTimesD1: [Double] = [12.2, 11.8, 42.1]
    let lapTimesD3: [Double] = [14.2, 43.2, 42.5]
    let laps: Int = 3
    var endPosition: CGFloat {
        return 1
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            HStack {
                leftSideOverlayView
                
                racingSimulatingView
                    .frame(maxWidth: .infinity)
            }
            .padding(.top, 40)
            
            closeButton
        }
    }
    
    private var leftSideOverlayView: some View {
        VStack(alignment: .leading, spacing: 4) {
            lapSectionView
            driverStandingListView
        }
        .padding(12)
    }
    
    private var driverStandingListView: some View {
        VStack(alignment: .leading, spacing: 4) {
            driverListView
            driverListView
            driverListView
            driverListView
            driverListView
            Spacer()
        }
        .padding(.horizontal, 2)
    }
    
    private var lapSectionView: some View {
        HStack {
            Text("LAP ")
            HStack(spacing: 0) {
                Text("1")
                    .bold()
                Text("/\(laps)")
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .foregroundColor(AppColors.layer)
        .background(AppColors.layer.opacity(0.06))
    }
    
    private var driverListView: some View {
        HStack(spacing: 8) {
            Rectangle()
                .frame(width: 4, height: 28)
                .foregroundColor(.blue)
            Text("Ver")
                .foregroundStyle(AppColors.gray)
                .bold()
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: 88)
        .background(AppColors.layer.opacity(0.04))
        
    }
    
    private var racingSimulatingView: some View {
        ZStack(alignment: .center) {
            circuitShape
                .stroke(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            DriverProgressView(
                lapTimes: lapTimesD1,
                laps: laps,
                color: Color(.blue),
                circuitShape: AnyShape(circuitShape)
            )
            
            DriverProgressView(
                lapTimes: lapTimesD3,
                laps: laps,
                color: Color(.red),
                circuitShape: AnyShape(circuitShape)
            )
        }
        .padding(.trailing, 200)
        .padding(.top, 56)
    }
    
    private var closeButton: some View {
        Button(action: {
            dismissAction()
        }) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(AppColors.gray.opacity(0.4))
                .font(.system(size: 24))
        }
        .padding(.top, -160)
        .padding(.trailing, -48)
        .frame(maxWidth: .infinity, alignment: .topTrailing)
    }
}
