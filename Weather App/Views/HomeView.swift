//
//  HomeView.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/28/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var location: DeviceLocation
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let weatherInfo = location.weatherData {
                    Text(weatherInfo.name ?? "NO")
                        .font(.system(size: 36, weight: .bold, design: .default))
                        .foregroundColor(Color.fgPrimary)
                        .padding(.bottom, 4)
                    
                    Text(String(weatherInfo.main?.temp ?? 0.0))
                        .font(.system(size: 20, weight: .light, design: .default))
                        .foregroundColor(Color.fgPrimary)
                } else {
                    LoadingView()
                }
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).padding(0).background(Color.bg)
        }
    }
}
