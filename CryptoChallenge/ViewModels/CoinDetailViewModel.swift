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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    var context: ModelContext

    init(coin: Coin, context: ModelContext) {
        self.coin = coin
        self.context = context
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
