//
//  CoinListView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI
import SwiftData

struct CoinListView: View {
    @ObservedObject var viewModel: CoinListViewModel
    
    
    // A binding to the user-selected mode (all, favorites, priceChange)
    @Binding var displayMode: DisplayMode
    
    var body: some View {
        List {
            ForEach(coinsToDisplay) { coin in
                NavigationLink {
                    CoinDetailsView(
                        viewModel: CoinDetailViewModel(coin: coin, context: viewModel.context)
                    )
                } label: {
                    CoinRowComponent(coin: coin)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 2)
                }
                
            }
        }
    }
    
    // Decide which coins to show based on the display mode
    private var coinsToDisplay: [Coin] {
        switch displayMode {
        case .all:
            // Applies search filtering (from viewModel.filteredCoins)
            return viewModel.filteredCoins
        case .favorites:
            // Only favorites
            return viewModel.favoriteCoins
        case .priceChange:
            // Sort by priceChangePercentage24h (descending: highest first)
            return viewModel.filteredCoins.sorted {
                // If either is nil, treat it as very low
                let lhs = $0.priceChangePercentage24h ?? -Double.greatestFiniteMagnitude
                let rhs = $1.priceChangePercentage24h ?? -Double.greatestFiniteMagnitude
                return lhs > rhs  // descending
            }
        }
    }
    
    // The modes supported
    enum DisplayMode {
        case all
        case favorites
        case priceChange
    }
}

/*
#Preview {
    struct Preview: View {
        var body: some View {
            CoinListView(displayMode: .constant(.all))
                .preferredColorScheme(.dark)
        }
    }
    
    return Preview()
}
*/
