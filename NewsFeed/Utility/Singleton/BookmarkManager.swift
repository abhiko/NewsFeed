//
//  BookmarkManager.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 03/12/24.
//

import SwiftUI

protocol BookmarkStorageProtocol: AnyObject {
    var bookmarkedArticlesData: Data { get set }
}

class AppStorageBookmarkStorage: BookmarkStorageProtocol {
   @AppStorage("bookmarkedArticles") var bookmarkedArticlesData: Data = Data()
}

final class BookmarkManager: ObservableObject {
    
    static let shared = BookmarkManager(storage: AppStorageBookmarkStorage())

    @Published private(set) var bookmarkedArticles: [Article] = []

    private let storage: BookmarkStorageProtocol?

    private init(storage: BookmarkStorageProtocol) {
          self.storage = storage
          loadBookmarks()
      }

    func toggleBookmark(for article: Article) {
        if isBookmarked(article) {
            removeBookmark(for: article)
        } else {
            addBookmark(for: article)
        }
    }

    func isBookmarked(_ article: Article) -> Bool {
        bookmarkedArticles.contains { $0.source?.id == article.source?.id }
    }
    
    func getAllBookmarkedArticles() -> [Article] {
        return bookmarkedArticles
    }

    private func addBookmark(for article: Article) {
        bookmarkedArticles.append(article)
        saveBookmarks()
    }

    private func removeBookmark(for article: Article) {
        bookmarkedArticles.removeAll { $0.source?.id == article.source?.id }
        saveBookmarks()
    }

    private func saveBookmarks() {
        do {
            let data = try JSONEncoder().encode(bookmarkedArticles)
            storage?.bookmarkedArticlesData = data
        } catch {
            print("Failed to save bookmarks: \(error.localizedDescription)")
        }
    }

    private func loadBookmarks() {
        guard  let storageValue = storage?.bookmarkedArticlesData,
               let articles = try? JSONDecoder().decode([Article].self, from: storageValue) else {
            return
        }
        self.bookmarkedArticles = articles
    }
}
