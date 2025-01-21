//
//  CryptoChallengeApp.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI

@main
struct CryptoChallengeApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView(showSplash: $showSplash)
                    .preferredColorScheme(.dark)
                    .onAppear {
                        testServices()
                    }
            } else {
                ContentView(coins: Coin.mockCoins)
                    .preferredColorScheme(.dark)
                    .onAppear {
                        testServices()
                    }
            }
        }
    }
    
    private func testServices() {
        Task {
            // Test CoinGeckoService
            do {
                let coinGeckoService = CoinGeckoService()
                let coins = try await coinGeckoService.fetchCoins()
                print("Fetched Coins: \(coins)")
            } catch {
                print("Error fetching coins: \(error)")
            }
            
            // Test NewsAPIService
            do {
                let newsAPIService = NewsAPIService()
                let articles = try await newsAPIService.fetchNews(for: "cryptocurrency")
                print("Fetched Articles: \(articles)")
            } catch {
                print("Error fetching news: \(error)")
            }
        }
    }
}
