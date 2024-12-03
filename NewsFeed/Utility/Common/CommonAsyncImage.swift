//
//  CommonAsyncImage.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

import SwiftUI

struct CommonAsyncImage: View {
    let url: URL?
    let height: CGFloat

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .clipped()
                .cornerRadius(8)
        } placeholder: {
            Color.gray.opacity(0.2)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .cornerRadius(8)
        }
    }
}
