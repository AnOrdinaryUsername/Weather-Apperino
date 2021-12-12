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
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(city), \(country)")
                            .font(.system(size: 32))
                        
                        Text("\(createReadableDate(date))")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(Color.fgSecondary)
                        
                        Text("\(roundAndRemoveDecimals(temperature))°F")
                            .font(.system(size: 48))
                    }.alignmentGuide(.leading, computeValue: { d in 120.0 })
                        .foregroundColor(Color.fgPrimary)
                        .padding(0)
                        .zIndex(1)
        
                    
                    URLImageView(withURL: "https://openweathermap.org/img/wn/\(icon)@4x.png")
                        .frame(width: 175, height: 175)
                        .zIndex(-1)
                        .offset(x: 12, y: 20)
                    
                }
            }
        }.frame(maxWidth: 350)
            .padding(20)
            .padding(.top, 0)
    }
}
