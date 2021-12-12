//
//  SavedWeather.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/28/21.
//

import SwiftUI

let nav = UINavigationBarAppearance()

struct SavedWeatherView: View {
    
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
                VStack {
                    NavigationLink(destination: Text("Content")) {
                        Text("link to view")
                    }.navigationTitle("Saved Weather")
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).padding(0).background(Color.bg)
            }
        // Without .navigationViewStyle(), warnings will appear in the
        // console saying "Unable to satisfy constraints".
        // Fix from SO: https://stackoverflow.com/a/68019546
        }.navigationViewStyle(.stack)
    }
}
