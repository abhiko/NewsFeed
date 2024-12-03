//
//  NewsArticleDetailView.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

struct NewsArticleDetailView: View {
    
    @StateObject var viewModel: NewsArticleDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(article: Article) {
        _viewModel = StateObject(wrappedValue: NewsArticleDetailViewModel(article: article))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                CommonAsyncImage(url: URL(string: viewModel.article?.urlToImage ?? ""), height: 200)

                Text(viewModel.article?.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)

                Text(viewModel.article?.publishedAt ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Divider()

                Text(viewModel.article?.description ?? "")
                    .font(.body)
                    .padding(.top)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                        viewModel.toggleBookmark()
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Image(systemName: viewModel.article?.isBookmarked ?? false ? ImageConstants.bookmarkFillIcon : ImageConstants.bookmarkIcon)
                        .resizable()
                        .foregroundColor(viewModel.article?.isBookmarked ?? false ? .yellow : .gray)
                }
            }
        }
    }
}
