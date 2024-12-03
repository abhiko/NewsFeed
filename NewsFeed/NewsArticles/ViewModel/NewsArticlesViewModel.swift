//
//  NewsArticlesViewModel.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

class NewsArticlesViewModel: ObservableObject {
    
    @Published private var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var categories: [Category] = []
    
    var filteredArticles: [Article] {
        articles.filter { $0.source?.id != nil }
    }
    
    init() {
        loadCategories()
    }
}

//MARK: - BottomSheet
extension NewsArticlesViewModel {
    private func loadCategories() {
        categories = [
            Category(id: UUID(), name: CategoryEnum.business.rawValue),
            Category(id: UUID(), name: CategoryEnum.science.rawValue),
            Category(id: UUID(), name: CategoryEnum.technology.rawValue),
            Category(id: UUID(), name: CategoryEnum.health.rawValue),
            Category(id: UUID(), name: CategoryEnum.sports.rawValue),
            Category(id: UUID(), name: CategoryEnum.entertainment.rawValue)
        ]
    }
}

//MARK: - Api Calling
extension NewsArticlesViewModel {
    
    func getNewsArticles(category: CategoryEnum.RawValue) async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
                
        let result: Result<[Article], Error> = await NetworkManager.shared.request(api: .newsArticles(category: category), responseType: [Article].self)
        
        switch result {
        case .success(let response):
            await MainActor.run {
                articles = response
                errorMessage = nil
                isLoading = false
            }
        case .failure(let error):
            await MainActor.run {
                isLoading = false
                errorMessage = "Failed to load articles. Please try again. Error: \(error.localizedDescription)"
            }
        }
    }

}
