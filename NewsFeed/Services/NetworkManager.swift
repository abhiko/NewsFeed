//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(api: NetworkAPI, responseType: T.Type) async -> Result<T, Error> {
        
        guard let url = api.fullURL else {
            return .failure(URLError(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = api.method.rawValue
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        if api.method == .post,
           let parameters = api.parameters {
            do {
                request.httpBody = try JSONEncoder().encode(parameters)
            } catch {
                print("Failed Request: Error encoding request body - \(error)")
                return .failure(error)
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let url = request.url {
                print("Request URL: \(url.absoluteString)")
            } else {
                print("Request URL is not available.")
            }
            
            if let responseData = String(data: data, encoding: .utf8) {
                print("Response Data:\n\(responseData)")
            } else {
                print("Response Data could not be converted to String.")
            }
            
            guard response is HTTPURLResponse else {
                return .failure(URLError(.badServerResponse))
            }
            
            let apiResponse = try JSONDecoder().decode(CommonAPIResponse<T>.self, from: data)
            
            if apiResponse.status == "ok", let successData = apiResponse.data {
                print("Response Data: \(successData)")
                return .success(successData)
            } else if let code = apiResponse.code, let message = apiResponse.message {
                print("Error Code: \(code)")
                print("Error Message: \(message)")
                return .failure(URLError(.badServerResponse))
            } else {
                return .failure(URLError(.cannotParseResponse))
            }
            
        } catch {
            print("Request failed with error: \(error)")
            return .failure(error)
        }
    }
}
