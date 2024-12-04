//
//  BookmarkViewModelTests.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 04/12/24.
//

import XCTest
import SwiftUI
@testable import NewsFeed

class BookmarkViewModelTests: XCTestCase {
    
    var viewModel: BookmarkViewModel!
    var mockArticle: Article!
    
    override func setUpWithError() throws {
        super.setUp()
        mockArticle =  Article(
            source: Source(id: "source1", name: "Source 1"),
            author: "Author 1",
            title: "Mock Article 1",
            description: "This is the description for mock article 1",
            url: "https://www.example.com/mock-article-1",
            urlToImage: "https://www.example.com/image1.jpg",
            publishedAt: "",
            content: "",
            isBookmarked: false
        )
        
        viewModel = BookmarkViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockArticle = nil
        super.tearDown()
    }
    
    func testLoadBookmarkedArticles_whenNoBookmarks_shouldReturnEmptyArray() {
        XCTAssertTrue(viewModel.bookmarkedArticles.isEmpty)
    }
}
