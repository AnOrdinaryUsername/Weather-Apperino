//
//  SearchAndSaveView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import SwiftUI

struct SearchAndSaveView: View {
    @ObservedObject var location: DeviceLocation
    @State var city: String
    
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 0) {
                Button(action: {
                    self.location.getWeather(at: city)
                }) {
                    Image(systemName: "1.magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .accessibilityLabel("Search")
                }.buttonStyle(PlainButtonStyle())
                    .padding(EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14))
                    .frame(maxHeight: .infinity)
                    .background(Color.searchBg)
                    .cornerRadius(8, corners: [.topLeft, .bottomLeft])
                
                TextField("Enter a city", text: $city)
                    .font(.system(size: 14))
                    .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 12))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(8, corners: [.topRight, .bottomRight])
                
            }.frame(height: 45)
            
            
            // TODO: Make this a button and add save button functionality
            Button(action: {
               print("temp")

            }) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .accessibilityLabel("Save weather data")
            }.padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .frame(height: 45)
                .foregroundColor(Color.pink)
                .background(Color.saveBg)
                .cornerRadius(8)
            
            
        }
    }
}
