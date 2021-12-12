//
//  URLImageView.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/11/21.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {
        Image(uiImage: image.withBaselineOffset(fromBottom: 0))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
