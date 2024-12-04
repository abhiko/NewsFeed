//
//  MockNewsArticlesInteractor.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation
@testable import NewsFeed

//class MockNewsArticlesInteractor: NewsArticlesInteractor {
//    
//    func getNewsArticles() async throws -> NewsArticlesResponseModel {
//        let response = NewsArticlesResponseModel(
//                   status: "200",
//                   totalResults: 2,
//                   articles: [
//                       Article(
//                           source: nil,
//                           author: nil,
//                           title: nil,
//                           description: nil,
//                           url: nil,
//                           urlToImage: nil,
//                           publishedAt: nil,
//                           content: nil
//                       )
//                   ]
//               )
//               
//        try await Task.sleep(nanoseconds: 1 * 1_000_000_000) // 1-second delay
//               
//               return response
//    }
//
//}
