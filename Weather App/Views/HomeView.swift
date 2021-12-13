//
//  HomeView.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/28/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var location: DeviceLocation
    @ObservedObject var storage: LocalData
    @State var city: String
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    SearchAndSaveView(location: location, storage: storage, city: city)
                    
                    VStack(spacing: 40) {
                        
                        if location.weatherData != nil && location.forecastData != nil {
                            if let weatherInfo = location.weatherData {
                                
                                MainWeatherInfoView(city: weatherInfo.name, country: weatherInfo.sys.country, date: weatherInfo.dt, temperature: weatherInfo.main.temp, icon: weatherInfo.weather[0].icon)
                                    .padding(.top, 40)
                                
                                if let forecastInfo = location.forecastData {
                                    ColumnBoxView {
                                        ForEach(forecastInfo.hourly, id: \.self) { hour in
                                            ColumnView(top: convertToHourly(hour.dt), bottom: "\(roundAndRemoveDecimals(hour.temp))°F")
                                        }
                                    }
                                    
                                    RowBoxView {
                                        VStack(spacing: 6) {
                                            ForEach(forecastInfo.daily, id: \.self) { day in
                                                RowView(left: convertToDay(day.dt), right: "\(roundAndRemoveDecimals(day.temp.day))°F")
                                            }
                                        }
                                    }
                                }
                                
                                RowBoxView {
                                    VStack(spacing: 6) {
                                        RowView(left: "High Temp", right: "\(roundAndRemoveDecimals(weatherInfo.main.tempMax))°F")
                                        
                                        RowView(left: "Low Temp", right: "\(roundAndRemoveDecimals(weatherInfo.main.tempMin))°F")
                                        
                                        
                                        RowView(left: "Humidity", right: "\(weatherInfo.main.humidity)%")
                                        
                                        
                                        RowView(left: "Cloudiness", right: "\(weatherInfo.clouds.all)%")
                                        
                                        RowView(left: "Sunset", right: convertToHourly(weatherInfo.sys.sunset))
                                        
                                        RowView(left: "Sunrise", right: convertToHourly(weatherInfo.sys.sunrise))
                                    }
                                }
                            }
                        } else {
                            LoadingView().frame(minHeight: geometry.size.height, alignment: .center)
                        }
                    }
                }.padding()
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height, maxHeight: .infinity)
            
                
            }.background(Color.bg).ignoresSafeArea()
        }
    }
}
