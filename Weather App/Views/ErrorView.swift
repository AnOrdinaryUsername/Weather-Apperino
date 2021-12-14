//
//  ErrorView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import SwiftUI

struct ErrorView: View {
    var error: String
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Sorry, there was an error when checking for the location. Please try again later.")
                    Text("\(error)").font(.system(size: 24, weight: .light))
                }.font(.system(size: 24))
                    .foregroundColor(Color.fgPrimary)
                
                Text("😢")
                    .font(.system(size: 96))
                    .frame(width: geometry.size.width, alignment: .center)
            }.padding(EdgeInsets(top: 24, leading: 12, bottom: 8, trailing: 12))
                .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height, maxHeight: .infinity)
        }
    }
}

