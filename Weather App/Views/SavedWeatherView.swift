//
//  SavedWeather.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/28/21.
//

import SwiftUI

let nav = UINavigationBarAppearance()

struct SavedWeatherView: View {
    @EnvironmentObject var savedItems: LocalData
    
    init() {
        nav.configureWithOpaqueBackground()
        nav.backgroundColor = UIColor(Color.bg)
        nav.titleTextAttributes = [.foregroundColor: UIColor.white]
        nav.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = nav
        UINavigationBar.appearance().scrollEdgeAppearance = nav
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(savedItems.storage.indices, id: \.self) { i in
                            VStack {
                                NavigationLink(destination: WeatherSummaryView(forecastData: savedItems.storage[i].forecast, weatherData: savedItems.storage[i].currentWeather)) {
                                    WeatherItemView(unixTime: savedItems.storage[i].currentWeather.dt, location: savedItems.storage[i].currentWeather.name, width: geometry.size.width, deleteItem: { savedItems.deleteLocationWeather(index: i) })
                                }.navigationTitle("Saved Weather")
                            }.padding().background(Color.bg)
                        }
                        
                    }.padding()
                        .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height, maxHeight: .infinity)
                        .navigationTitle("Saved Weather")
                    
                }.background(Color.bg)
            }
            // Without .navigationViewStyle(), warnings will appear in the
            // console saying "Unable to satisfy constraints".
            // Fix from SO: https://stackoverflow.com/a/68019546
        }.navigationViewStyle(.stack)
            .background(Color.bg)
            .edgesIgnoringSafeArea(.bottom)
    }
}
