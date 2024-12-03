//
//  NetworkServices.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

enum NetworkAPI {
    
    enum NetworkEnvironment: String {
        case developmentUAT
    }
    
    fileprivate var networkEnvironment: NetworkEnvironment {
        return .developmentUAT
    }
    
    fileprivate var baseURL: String {
        switch networkEnvironment {
        case .developmentUAT:
            return "https://newsapi.org/"
        }
    }
    
    case newsArticles(category: String)
}

extension NetworkAPI {
    
    var path: String {
        switch self  {
        case .newsArticles:
            return  "v2/top-headlines"
        }
    }
    
    var parameters: Encodable? {
        switch self {
        case .newsArticles(let category):
            return [
                "apiKey": "5f0052e539c24039a77696fb76534bb2",
                "country": "us",
                "category": category,
                "sortBy": "publishedAt"
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .newsArticles:
            return .get
        }
    }
    
    var fullURL: URL? {
        guard var components = URLComponents(string: baseURL + path) else {
            return nil
        }
        
        if let parameters = self.parameters, method == .get {
            components.queryItems = (parameters as? [String: Any])?.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        return components.url
    }
    
}

