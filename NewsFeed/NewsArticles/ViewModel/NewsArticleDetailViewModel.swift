//
//  NewsArticleDetailViewModel.swift
//  NewsFeed
//
//  Created by Abhishek kohli on 03/12/24.
//

import SwiftUI

final class NewsArticleDetailViewModel: ObservableObject {
    
    @Published var article: Article?

    init(article: Article) {
        var articleWithBookmark = article
        articleWithBookmark.isBookmarked = BookmarkManager.shared.isBookmarked(article)
        self.article = articleWithBookmark
    }

    func toggleBookmark() {
        guard let article = article else { return }
        BookmarkManager.shared.toggleBookmark(for: article)
        updateBookmarkStatus()
    }

    private func updateBookmarkStatus() {
        guard let article = article else { return }
        self.article?.isBookmarked = BookmarkManager.shared.isBookmarked(article)
    }
}
