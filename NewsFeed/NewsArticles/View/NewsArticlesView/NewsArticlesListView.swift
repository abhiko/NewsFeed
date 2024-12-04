//
//  NewsArticlesListView.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

struct NewsArticlesListView: View {
    let article: Article?

    var body: some View {
        VStack(alignment: .leading) {
            
            CommonAsyncImage(url: URL(string: article?.urlToImage ?? ""), height: 180)
            
            Text(article?.title ?? "")
                .font(.headline)
                .lineLimit(1)
                .padding(.bottom, 0)

            Text(article?.description ?? "")
                .font(.subheadline)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
    }
}
