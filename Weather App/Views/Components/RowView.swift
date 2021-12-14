//
//  RowView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/11/21.
//

import SwiftUI

struct RowView: View {
    var left: String
    var right: String
    
    var body: some View {
        HStack {
            Text("\(left)").foregroundColor(Color.fgPrimary)
            
            Spacer()
            
            Text("\(right)").foregroundColor(Color.fgTertiary)
        }.font(.system(size: 20))
    }
}
