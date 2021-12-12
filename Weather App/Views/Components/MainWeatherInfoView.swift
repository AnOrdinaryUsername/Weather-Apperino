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
                ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(city), \(country)")
                        .font(.system(size: 32))
                    
                    Text("\(createReadableDate(date))")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(Color.fgSecondary)
                    
                    Text("\(String(format: "%.0f°F", temperature.rounded()))")
                        .font(.system(size: 48))
                }.foregroundColor(Color.fgPrimary)
                    .padding(0)
                    .zIndex(1)
              
#if available
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(icon)@4x.png")).zIndex(-1).offset(x: -100)
#else
                URLImageView(withURL: "https://openweathermap.org/img/wn/\(icon)@4x.png").zIndex(-1)
#endif
                
                }
            }
        }.padding(20)
    }
    
    func createReadableDate(_ unixTimestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(unixTimestamp))
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/YY"
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}
