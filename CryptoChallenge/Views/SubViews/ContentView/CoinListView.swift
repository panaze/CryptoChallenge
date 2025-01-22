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
        .overlay {
            if coinsToDisplay.isEmpty {
                contentUnavailableView
            }
        }
    }
    
    private var coinsToDisplay: [Coin] {
        switch displayMode {
        case .all:
            return viewModel.filteredCoins
        case .favorites:
            return viewModel.favoriteCoins
        case .priceChange:
            return viewModel.filteredCoins.sorted {
                let lhs = $0.priceChangePercentage24h ?? -Double.greatestFiniteMagnitude
                let rhs = $1.priceChangePercentage24h ?? -Double.greatestFiniteMagnitude
                return lhs > rhs
            }
        }
    }
    
    private var contentUnavailableView: some View {
        switch displayMode {
        case .all:
            return ContentUnavailableView {
                Label("No Coins Found", systemImage: "exclamationmark.triangle")
            } description: {
                Text("Try adjusting your search or check back later.")
            }
            .padding()
        case .favorites:
            return ContentUnavailableView {
                Label("No Favorites", systemImage: "star.slash")
            } description: {
                Text("Mark coins as favorites to see them here.")
            }
            .padding()
        case .priceChange:
            return ContentUnavailableView {
                Label("No Price Data", systemImage: "chart.line.uptrend.xyaxis")
            } description: {
                Text("There is no price change data available at the moment.")
            }
            .padding()
        }
    }
    
    // The modes we support
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
