//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 02/12/24.
//

import XCTest
import SwiftUI
@testable import NewsFeed

@MainActor
final class NewsFeed: XCTestCase {
    
//    var mockInteractor: MockNewsArticlesInteractor!
//    var viewModel: NewsArticlesViewModel!
//    var newsArticlesView: NewsArticlesView!
    
    override func setUpWithError() throws {
//        mockInteractor = MockNewsArticlesInteractor()
//        viewModel = NewsArticlesViewModel(interactor: mockInteractor)
//        newsArticlesView.viewModel = viewModel
    }
    
    override func tearDownWithError() throws {
//        mockInteractor = nil
//        viewModel = nil
//        newsArticlesView = nil
    }
    
    func testExample() throws {
//        Task {
//            await viewModel.fetchNewsArticles()
//        }
//        
//        XCTAssertTrue(mockInteractor.fetchNewsArticlesCalled, "Done")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
