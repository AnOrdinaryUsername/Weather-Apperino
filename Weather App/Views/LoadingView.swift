//
//  Loading.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/11/21.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    
       var body: some View {
           ZStack {
               Text("Loading")
                   .font(.system(size: 36, design: .rounded))
                   .foregroundColor(Color.fgPrimary)
                   .bold()
                   .offset(x: 0, y: -35)
    
               RoundedRectangle(cornerRadius: 3)
                   .stroke(Color(.systemGray5), lineWidth: 3)
                   .frame(width: 150, height: 3)

               RoundedRectangle(cornerRadius: 3)
                   .stroke(Color.green, lineWidth: 3)
                   .frame(width: 30, height: 3)
                   .offset(x: isLoading ? 66 : -66, y: 0)
                   .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
           }
           .onAppear() {
               self.isLoading = true
           }
       }
}


/* Some problems are:
    - As I adjust the font size of 🌤 in the HStack, it shifts the other text and the 🌤 emoji goes off screen if it's too big
    - Text() is just temporarily placeholders for the actual data
    - Think there is a much more efficient way to position everything in the HStack including the HStack itself instead of
        just constantly using Spacing()
    - Overrall, things are a little too fixed. Things are moving relative to each other which I don't is what we want. It's probably preferred to be more dynamic and flexible
 */
