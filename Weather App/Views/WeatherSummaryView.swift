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
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                SearchAndSaveView(location: location, city: city)
                    .frame(maxWidth: geometry.size.width)
                    .padding(20)
                
                VStack(spacing: 0) {
                   
                    if location.weatherData != nil && location.forecastData != nil {
                    if let weatherInfo = location.weatherData {
                        
                        MainWeatherInfoView(city: weatherInfo.name, country: weatherInfo.sys.country, date: weatherInfo.dt, temperature: weatherInfo.main.temp, icon: weatherInfo.weather[0].icon)
                        
                        if let forecastInfo = location.forecastData {
                            ColumnBoxView {
                                ForEach(forecastInfo.hourly, id: \.self) { hour in
                                    ColumnView(top: convertToHourly(hour.dt), bottom: "\(roundAndRemoveDecimals(hour.temp))°F")
                                }
                            }
                        }
                    
                        RowBoxView {
                            VStack(spacing: 6) {
                                RowView(left: "High Temp", right: "\(roundAndRemoveDecimals(weatherInfo.main.tempMax))°F")
                                
                                RowView(left: "Low Temp", right: "\(roundAndRemoveDecimals(weatherInfo.main.tempMin))°F")
                                
                                
                                RowView(left: "Humidity", right: "\(weatherInfo.main.humidity)%")
                                
                                
                                RowView(left: "Cloudiness", right: "\(weatherInfo.clouds.all)%")
                            }.padding(6)
                        }
                        
                        
                    }
                    } else {
                        LoadingView()
                    }
                }.frame(minHeight: geometry.size.height, maxHeight: .infinity)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .padding(20)
                    .padding(.trailing, 20)
                
            }.background(Color.bg)
        }
    }
}
