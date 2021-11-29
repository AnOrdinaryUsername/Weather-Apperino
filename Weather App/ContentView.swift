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
    @State private var city: String = ""
    @State private var selection = 1
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                HStack(spacing: 0) {
                    Button(action: {
                        self.location.getWeather(at: city)
                    }) {
                        Image(systemName: "1.magnifyingglass")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .accessibilityLabel("Search")
                    }.buttonStyle(PlainButtonStyle())
                        .padding(EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14))
                        .frame(maxHeight: .infinity)
                        .background(Color.searchBg)
                        .cornerRadius(8, corners: [.topLeft, .bottomLeft])
                    
                    TextField("Enter a city", text: $city)
                        .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 12))
                        .frame(maxHeight: .infinity)
                        .background(Color.white)
                        .cornerRadius(8, corners: [.topRight, .bottomRight])
                    
                }.frame(height: 50)
                
                // TODO: Make this a button and add save button functionality
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 23, height: 23)
                    .accessibilityLabel("Save weather data")
                
            }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                .background(Color.bg)
            
            TabView(selection: $selection) {
                HomeView(location: location).tabItem {
                    Label("Home", systemImage: "house")
                }.tag(1)
                
                SavedWeatherView().tabItem {
                    Label("Saved", systemImage: "heart.fill")
                }.tag(2)
            }
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
