//
//  MainWeatherInfoView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/11/21.
//

import SwiftUI

struct MainWeatherInfoView: View {
    var city: String
    var country: String
    var date: Int
    var temperature: Double
    var icon: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(city), \(country)")
                            .font(.system(size: 32))
                        
                        Text("\(createReadableDate(date))")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(Color.fgSecondary)
                        
                        Text("\(roundAndRemoveDecimals(temperature))°F")
                            .font(.system(size: 48))
                    }.alignmentGuide(.leading, computeValue: { d in 100.0 })
                        .foregroundColor(Color.fgPrimary)
                        .padding(0)
                        .zIndex(1)
                    
                    URLImageView(withURL: "https://openweathermap.org/img/wn/\(icon)@4x.png")
                        .frame(width: 175, height: 175)
                        .zIndex(0)
                        .offset(x: 12, y: 20)
                    
                }
            
        }.frame(maxWidth: 350)
      
    }
}
