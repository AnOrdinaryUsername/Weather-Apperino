//
//  ColumnView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import SwiftUI


struct ColumnView: View {
    var top: String
    var bottom: String
    
    var body: some View {
        VStack {
            Text("\(top)")
                .foregroundColor(Color.fgPrimary)
                .font(.system(size: 16))
            
            Spacer()
            
            Text("\(bottom)")
                .foregroundColor(Color.fgTertiary)
        }.font(.system(size: 20))
    }
}
