//
//  ContentView.swift
//  Weather App
//
//  Created by user198043 on 9/30/21.
//

import SwiftUI

extension Color {
    static let bg = Color("background")
    static let fgPrimary = Color(red: 0.96, green: 0.96, blue: 0.96)
    static let searchBg = Color(red: 0.94, green: 0.94, blue: 0.94)
    static let saveBg = Color(red: 0.25, green: 0.27, blue: 0.48)
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    @ObservedObject var location = DeviceLocation()
    @State var city: String = ""
    @State var hasSearched: Bool = false
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            WeatherSummaryView(location: location, city: city, hasSearched: hasSearched).tabItem {
                Label("Home", systemImage: "house")
            }.tag(1)
            
            SavedWeatherView().tabItem {
                Label("Saved", systemImage: "heart.fill")
            }.tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
