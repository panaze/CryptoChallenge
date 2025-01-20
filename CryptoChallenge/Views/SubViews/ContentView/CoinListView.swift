//
//  CoinListView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI
import SwiftData

struct CoinListView: View {
    
    // A binding to the user-selected mode (all, favorites, priceChange)
    @Binding var displayMode: DisplayMode
    @State var coinsToDisplay = Coin.mockCoins
    
    var body: some View {
        List {
            ForEach(coinsToDisplay) { coin in
                NavigationLink {
                    CoinDetailsView(coin: coin)
                } label: {
                    CoinRowComponent(coin: coin)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 2)
                }
                
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

#Preview {
    struct Preview: View {
        var body: some View {
            CoinListView(displayMode: .constant(.all))
        }
    }
    
    return Preview()
}

