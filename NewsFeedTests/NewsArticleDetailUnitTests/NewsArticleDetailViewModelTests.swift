//
//  NewsArticleDetailViewModelTests.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 04/12/24.
//

import XCTest
import SwiftUI
@testable import NewsFeed

 class NewsArticleDetailViewModelTests: XCTestCase {
    
    var viewModel: NewsArticleDetailViewModel!
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
            publishedAt: "2024-12-04T12:00:00Z",
            content: "Content of the mock article 1",
            isBookmarked: false
        )
        
        viewModel = NewsArticleDetailViewModel(article: mockArticle)

    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockArticle = nil
        super.tearDown()
    }
    
    func testInitialization_withArticle_shouldSetArticleProperty() {
           XCTAssertEqual(viewModel.article?.title, "Mock Article 1")
       }
}

