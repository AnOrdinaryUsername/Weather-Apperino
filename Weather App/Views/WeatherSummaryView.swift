//
//  WeatherSummaryView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import SwiftUI

struct WeatherSummaryView: View {
    var forecastData: Forecast
    var weatherData: CurrentWeatherAPI
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 40) {
                    MainWeatherInfoView(city: weatherData.name, country: weatherData.sys.country, date: weatherData.dt, temperature: weatherData.main.temp, icon: weatherData.weather[0].icon)
                        .padding(.top, 20)
                    
                    ColumnBoxView {
                        ForEach(forecastData.hourly, id: \.self) { hour in
                            ColumnView(top: convertToHourly(hour.dt), bottom: "\(roundAndRemoveDecimals(hour.temp))°F")
                        }
                    }
                    
                    RowBoxView {
                        VStack(spacing: 6) {
                            ForEach(forecastData.daily, id: \.self) { day in
                                RowView(left: convertToDay(day.dt), right: "\(roundAndRemoveDecimals(day.temp.day))°F")
                            }
                        }
                    }
                    
                    RowBoxView {
                        VStack(spacing: 6) {
                            RowView(left: "High Temp", right: "\(roundAndRemoveDecimals(weatherData.main.tempMax))°F")
                            
                            RowView(left: "Low Temp", right: "\(roundAndRemoveDecimals(weatherData.main.tempMin))°F")
                            
                            
                            RowView(left: "Humidity", right: "\(weatherData.main.humidity)%")
                            
                            
                            RowView(left: "Cloudiness", right: "\(weatherData.clouds.all)%")
                            
                            RowView(left: "Sunset", right: convertToHourly(weatherData.sys.sunset))
                            
                            RowView(left: "Sunrise", right: convertToHourly(weatherData.sys.sunrise))
                        }
                    }.padding(.bottom, 20)
                }.frame(maxWidth: geometry.size.width, minHeight: geometry.size.height, maxHeight: .infinity)
                    .padding()
                    .background(Color.bg).ignoresSafeArea()
                
            }
        }
    }
}
