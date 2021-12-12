//
//  RowView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/11/21.
//

import SwiftUI

struct RowView: View {
    var columnOne: String
    var columnTwo: String
    
    var body: some View {
        HStack {
            Text("\(columnOne)")
            
            Spacer().frame(maxWidth: .infinity)
            
            Text("\(columnTwo)")
        }
    }
}
