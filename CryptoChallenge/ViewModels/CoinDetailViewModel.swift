//
//  CoinDetailViewModel.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI
import SwiftData

@MainActor
class CoinDetailViewModel: ObservableObject {
    @Published var coin: Coin
    @Published var newsArticles: [NewsArticle] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let newsService = NewsAPIService()
    var context: ModelContext

    init(coin: Coin, context: ModelContext) {
        self.coin = coin
        self.context = context
    }

    func fetchNewsArticles() async {
        isLoading = true
        errorMessage = nil
        do {
            let articles = try await newsService.fetchNews(for: coin.name)
            self.newsArticles = articles
        } catch {
            self.errorMessage = "Failed to fetch news: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func toggleFavorite() {
        coin.isFavorite.toggle()
        do {
            try context.save()
        } catch {
            print("Error saving favorite status: \(error.localizedDescription)")
        }
    }

}
