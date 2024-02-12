//
//  SimulatingView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct SimulatingView: View {
    
    @EnvironmentObject var viewModel: SimulatingViewModel
    var circuitShape: AnyShape
    var selectedYear: Int
    
    var dismissAction: () -> Void
    
    let dotLength: CGFloat = 0.0001
    var laps: Int = 1
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
    }
    
    private var driverStandingListView: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(viewModel.raceResults.prefix(5))  { raceResult in
                driverListView(
                    driverName: raceResult.driver!.code,
                    lapTimes: raceResult.fastestLap!.time,
                    color: ConstructorColor.getColor(for: raceResult.constructor!.constructorID)
                )
            }
            Spacer()
        }
        .padding(.horizontal, 2)
    }
    
    private func driverListView(driverName: String, lapTimes: String, color: Color) -> some View {
        HStack(spacing: 4) {
            Rectangle()
                .frame(width: 2, height: 24)
                .foregroundColor(color)
            Text(driverName)
                .foregroundStyle(AppColors.gray)
                .font(Font.system(size: 11))
                .bold()
            Spacer()
            Text(lapTimes)
                .foregroundStyle(AppColors.gray)
                .font(Font.system(size: 12))
                .bold()
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(AppColors.layer.opacity(0.04))
        .frame(maxWidth: 116)
        
    }
    
    private var lapSectionView: some View {
        HStack {
            Text("Fastest Lap")
            Spacer()
            
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .foregroundColor(AppColors.layer)
        .background(AppColors.layer.opacity(0.06))
        .frame(maxWidth: 116)
    }
    
    private var racingSimulatingView: some View {
        ZStack(alignment: .center) {
            circuitShape
                .stroke(LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(Array(viewModel.raceResults.prefix(5).enumerated()), id: \.element.driver?.driverID) { index, raceResult in
                if let lapTimeString = raceResult.fastestLap?.time {
                    let fastestLapTimeInSeconds = viewModel.convertTimeToSeconds(timeString: lapTimeString)
                    DriverProgressView(
                        fastestLap: fastestLapTimeInSeconds,
                        laps: laps,
                        color: ConstructorColor.getColor(for: raceResult.constructor!.constructorID),
                        circuitShape: AnyShape(circuitShape)
                    )
                }
            }
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
