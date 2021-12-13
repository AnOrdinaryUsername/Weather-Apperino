//
//  WeatherItemView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import SwiftUI

struct WeatherItemView: View {
    var unixTime: Int
    var location: String
    var width: CGFloat
    var deleteItem: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Text("\(createReadableDate(unixTime))")
                    .font(.system(size: 16))
                Text("\(location)")
                    .font(.system(size: 18, weight: .heavy))
            }.foregroundColor(Color.bg)
            
            Spacer()
            
            Button(action: {
                deleteItem()
            }) {
                Image(systemName: "trash.fill")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .accessibilityLabel("Delete item")
            }.frame(height: 25)
                .padding()
                .foregroundColor(Color.fgPrimary)
                .background(Color.bg)
                .cornerRadius(6)
        }.padding(16)
            .frame(width: width)
            .background(Color.bgTertiary)
            .cornerRadius(8)
        
    }
}
