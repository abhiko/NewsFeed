//
//  BookmarkViewModel.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 03/12/24.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
    
    @Published var bookmarkedArticles: [Article] = []
    
    func loadBookmarkedArticles() {
        bookmarkedArticles = BookmarkManager.shared.bookmarkedArticles
    }
}
