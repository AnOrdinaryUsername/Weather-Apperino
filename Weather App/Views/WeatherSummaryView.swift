//
//  WeatherSummaryView.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/28/21.
//

import SwiftUI

struct WeatherSummaryView: View {
    @ObservedObject var location: DeviceLocation
    @State var city: String
    @State var hasSearched: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                HStack(spacing: 0) {
                    Button(action: {
                        self.location.getWeather(at: city)
                        self.hasSearched = true
                    }) {
                        Image(systemName: "1.magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .accessibilityLabel("Search")
                    }.buttonStyle(PlainButtonStyle())
                        .padding(EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14))
                        .frame(maxHeight: .infinity)
                        .background(Color.searchBg)
                        .cornerRadius(8, corners: [.topLeft, .bottomLeft])
                    
                    TextField("Enter a city", text: $city)
                        .font(.system(size: 14))
                        .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 12))
                        .frame(maxHeight: .infinity)
                        .background(Color.white)
                        .cornerRadius(8, corners: [.topRight, .bottomRight])
                    
                }.frame(height: 45)
                
                if hasSearched {
                    // TODO: Make this a button and add save button functionality
                    Button(action: {
                        print(location.weatherData?.coord)
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .accessibilityLabel("Save weather data")
                    }.padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .frame(height: 45)
                        .foregroundColor(Color.pink)
                        .background(Color.saveBg)
                        .cornerRadius(8)
                }
                
            }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                .background(Color.bg)
            
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
}
