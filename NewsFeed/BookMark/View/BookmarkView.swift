//
//  BookmarkView.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 03/12/24.
//

import SwiftUI

struct BookmarkView: View {
    
    @StateObject var viewModel = BookmarkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.bookmarkedArticles.isEmpty {
                    Text("No bookmarks yet.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.bookmarkedArticles, id: \.url) { article in
                        NewsArticlesListView(article: article)
                            .background(
                                NavigationLink("", destination: NewsArticleDetailView(article: article))
                                    .opacity(0)
                            )
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            } .onAppear {
                viewModel.loadBookmarkedArticles()
            }
            
        }
        .navigationTitle("Bookmarks")
        
    }
}

//#Preview {
//    BookmarkView()
//}
