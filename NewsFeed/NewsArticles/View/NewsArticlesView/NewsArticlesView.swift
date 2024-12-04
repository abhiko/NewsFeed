//
//  NewsArticlesView.swift
//  NewsFeed
//
//  Created by Abhishek Kohli on 02/12/24.
//

import SwiftUI

struct NewsArticlesView: View {
    @StateObject var viewModel = NewsArticlesViewModel()
    @State private var showBottomSheet = false
    @State private var selectedCategory: Category?
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else if viewModel.filteredArticles.isEmpty {
                    Text("No articles available")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                    Button(action: {
                        self.getApiCallNewsArticles()
                    }) {
                        Text("Try Again")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .padding(.top)
                } else {
                    List {
                        Section(header:
                                    Text("\(selectedCategory?.name ?? "") News")
                            .font(.title2)
                            .foregroundColor(.blue)
                        )  {
                            ForEach(viewModel.filteredArticles, id: \.url) { article in
                                NewsArticlesListView(article: article)
                                    .background(
                                        NavigationLink("", destination: NewsArticleDetailView(article: article))
                                            .opacity(0)
                                    )
                            }
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        self.getApiCallNewsArticles()
                    }
                }
            }
            .navigationTitle("News Articles")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            showBottomSheet.toggle()
                        } label: {
                            Image(systemName: ImageConstants.menuIcon)
                                .resizable()
                                .foregroundColor(.blue)
                        }
                        
                        NavigationLink(destination: BookmarkView()) {
                            Image(systemName: ImageConstants.bookmarkFillIcon)
                                .resizable()
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .onAppear {
                if selectedCategory == nil {
                    selectedCategory = viewModel.categories.first
                }
            }
            .onChange(of: selectedCategory) { oldValue, newValue in
                if newValue != nil {
                    self.getApiCallNewsArticles()
                    showBottomSheet = false
                }
            }
            .sheet(isPresented: $showBottomSheet) {
                CategoryBottomSheetView(categories: viewModel.categories, selectedCategoryBind: $selectedCategory)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
        
    }
    
    private func getApiCallNewsArticles() {
        Task {
            await viewModel.getNewsArticles(category: selectedCategory?.name ?? CategoryEnum.business.rawValue)
        }
    }
}

//#Preview {
//    NewsArticlesView()
//}
