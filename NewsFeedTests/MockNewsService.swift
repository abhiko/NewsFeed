//
//  MockNewsService.swift
//  NewsFeedTests
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation
@testable import NewsFeed

class MockNewsService: NewsServiceProtocol {
    
    var shouldReturnError: Bool = false
    
    var mockArticles: [Article] = [
        Article(
            source: Source(id: "source1", name: "Source 1"),
            author: "Author 1",
            title: "Mock Article 1",
            description: "This is the description for mock article 1",
            url: "https://www.example.com/mock-article-1",
            urlToImage: "https://www.example.com/image1.jpg",
            publishedAt: "2024-12-04T12:00:00Z",
            content: "Content of the mock article 1",
            isBookmarked: false
        ),
        Article(
            source: Source(id: "source2", name: "Source 2"),
            author: "Author 2",
            title: "Mock Article 2",
            description: "This is the description for mock article 2",
            url: "https://www.example.com/mock-article-2",
            urlToImage: "https://www.example.com/image2.jpg",
            publishedAt: "2024-12-04T13:00:00Z",
            content: "Content of the mock article 2",
            isBookmarked: false
        )
    ]
    
    func request<T: Decodable>(api: NetworkAPI, responseType: T.Type) async -> Result<T, Error> {
          if shouldReturnError {
              return .failure(NSError(domain: "MockError", code: -1, userInfo: nil))
          } else {
              return .success(mockArticles as! T)
          }
      }
}
