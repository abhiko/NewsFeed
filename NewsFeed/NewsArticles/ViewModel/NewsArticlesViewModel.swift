//
//  NewsArticlesViewModel.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

class NewsArticlesViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var categories: [Category] = []
    
    private let newsService: NewsServiceProtocol?
    
    var filteredArticles: [Article] {
        articles.filter { $0.source?.id != nil }
    }
    
    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
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

        await updateUI(isLoading: true, errorMessage: nil)
        
        guard let service = newsService else {
            await updateUI(isLoading: false, errorMessage: "News service is unavailable")
            return
        }
        
        let result: Result<[Article], Error> = await service.request(api: .newsArticles(category: category), responseType: [Article].self)
        
        switch result {
        case .success(let response):
            await updateUI(isLoading: false, errorMessage: nil, articles: response)
        case .failure(let error):
            await updateUI(isLoading: false, errorMessage: "Failed to load articles. Error: \(error.localizedDescription)")
        }
    }
    
    private func updateUI(isLoading: Bool, errorMessage: String? = nil, articles: [Article]? = nil) async {
        await MainActor.run {
            self.isLoading = isLoading
            self.errorMessage = errorMessage
            if let articles = articles {
                self.articles = articles
            }
        }
    }
    
}
