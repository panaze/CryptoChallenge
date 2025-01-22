//
//  CoinListViewModel.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI
import SwiftData

@MainActor
class CoinListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var lastUpdated: Date? = nil

    var context: ModelContext

    private let coinService = CoinGeckoService()

    
    init(context: ModelContext) {
        self.context = context
    }

    // Computed property to fetch coins from SwiftData
    var allCoins: [Coin] {
        let descriptor = FetchDescriptor<Coin>(sortBy: [SortDescriptor(\.marketCapRank)])
        let coins = (try? context.fetch(descriptor)) ?? []
        return coins
    }

    // Filter coins by name
    var filteredCoins: [Coin] {
        guard !searchText.isEmpty else { return allCoins }
        return allCoins.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }

    func fetchCoins() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedCoins = try await coinService.fetchCoins()
            // Update local store with the latest
            persistCoinsToSwiftData(fetchedCoins)
            lastUpdated = Date()
        } catch {
            errorMessage = "Error fetching coins: \(error.localizedDescription)"
        }
        isLoading = false
    }

    /// Save or update coins in SwiftData local storage
    private func persistCoinsToSwiftData(_ newCoins: [Coin]) {
        // 1. Get all existing coins in the store
        let descriptor = FetchDescriptor<Coin>()
        let existingCoins = (try? context.fetch(descriptor)) ?? []

        // 2. Create or update
        for newCoin in newCoins {
            if let existingCoin = existingCoins.first(where: { $0.id == newCoin.id }) {
                // Update existing
                existingCoin.symbol = newCoin.symbol
                existingCoin.name = newCoin.name
                existingCoin.image = newCoin.image
                existingCoin.currentPrice = newCoin.currentPrice
                existingCoin.marketCap = newCoin.marketCap
                existingCoin.marketCapRank = newCoin.marketCapRank
                existingCoin.totalVolume = newCoin.totalVolume
                existingCoin.high24h = newCoin.high24h
                existingCoin.low24h = newCoin.low24h
                existingCoin.priceChange24h = newCoin.priceChange24h
                existingCoin.priceChangePercentage24h = newCoin.priceChangePercentage24h
                existingCoin.marketCapChange24h = newCoin.marketCapChange24h
                existingCoin.marketCapChangePercentage24h = newCoin.marketCapChangePercentage24h
                existingCoin.circulatingSupply = newCoin.circulatingSupply
                existingCoin.totalSupply = newCoin.totalSupply
                existingCoin.maxSupply = newCoin.maxSupply
                existingCoin.ath = newCoin.ath
                existingCoin.athChangePercentage = newCoin.athChangePercentage
                existingCoin.athDate = newCoin.athDate
                existingCoin.atl = newCoin.atl
                existingCoin.atlChangePercentage = newCoin.atlChangePercentage
                existingCoin.atlDate = newCoin.atlDate
                existingCoin.lastUpdated = newCoin.lastUpdated
                existingCoin.fullyDilutedValuation = newCoin.fullyDilutedValuation
                // Keep existingCoin.isFavorite
            } else {
                // Insert new
                context.insert(newCoin)
            }
        }
        
        for oldCoin in existingCoins {
            if !newCoins.contains(where: { $0.id == oldCoin.id }) {
                context.delete(oldCoin)
            }
        }

        //Save changes
        do {
            try context.save()
        } catch {
            print("Error saving to SwiftData: \(error.localizedDescription)")
        }
    }

    // Sorting: Market Ascending
    var marketAscendingCoins: [Coin] {
        return allCoins.sorted { (c1, c2) in
            (c1.marketCapRank ?? Int.max) < (c2.marketCapRank ?? Int.max)
        }
    }

    // Favorites
    var favoriteCoins: [Coin] {
        return allCoins.filter { $0.isFavorite == true }
    }
}
