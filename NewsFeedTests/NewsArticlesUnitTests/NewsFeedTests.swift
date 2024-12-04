//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 02/12/24.
//

import XCTest
import SwiftUI
@testable import NewsFeed

final class NewsFeed: XCTestCase {
    
    var viewModel: NewsArticlesViewModel!
    var mockService: MockNewsService!
    
    override func setUpWithError() throws {
        super.setUp()
        mockService = MockNewsService()
        viewModel = NewsArticlesViewModel(newsService: mockService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchArticlesSuccess() async {

        mockService.shouldReturnError = false

        await viewModel.getNewsArticles(category: "business")

        XCTAssertEqual(viewModel.articles.count, mockService.mockArticles.count)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFetchArticlesFailure() async {

        mockService.shouldReturnError = true

        await viewModel.getNewsArticles(category: "business")

        XCTAssertEqual(viewModel.articles.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testCategoriesLoaded() {
        XCTAssertEqual(viewModel.categories.count, 6)
        XCTAssertEqual(viewModel.categories.first?.name, "Business")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
