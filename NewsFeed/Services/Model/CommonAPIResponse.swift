//
//  APIResponse.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

// Common response wrapper
struct CommonAPIResponse<T: Decodable>: Decodable {
    let status: String?
    let code: String?
    let message: String?
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case status
        case code
        case message
        case data = "articles"
    }
}
