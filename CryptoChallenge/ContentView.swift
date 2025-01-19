//
//  ContentView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI

struct ContentView: View {
    let coins: [Coin]
    
    var body: some View {
        NavigationStack {
            List(coins, id: \.id) { coin in
                NavigationLink(destination: CoinDetailsView(coin: coin)) {
                    
                    // Overview
                    VStack(alignment: .leading) {
                        Text(coin.name)
                            .font(.headline)
                        Text(coin.symbol.uppercased())
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

#Preview {
    ContentView(coins: Coin.mockCoins)
}
