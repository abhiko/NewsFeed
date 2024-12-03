//
//  NewsArticlesResponseModel.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var isBookmarked: Bool? = false
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
