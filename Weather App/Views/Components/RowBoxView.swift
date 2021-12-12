//
//  RowBoxView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/11/21.
//

import SwiftUI

struct RowBoxView<Content: View>: View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
            VStack(content: content)
            .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
            .background(Color.bgSecondary)
            .padding(20)
    }
}
