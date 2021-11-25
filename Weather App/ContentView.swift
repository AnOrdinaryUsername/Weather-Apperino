//
//  ContentView.swift
//  Weather App
//
//  Created by user198043 on 9/30/21.
//

import SwiftUI

extension Color {
    static let bg = Color("background")
    static let fgPrimary = Color(red: 245, green: 245, blue: 245)
}

struct ContentView: View {
    @ObservedObject var location = DeviceLocation()
    
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
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).background(Color.black)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
