//
//  CoinDetailsView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    
    var body: some View {
        ZStack{
            
            AnimatedMeshGradient()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    if let price = coin.currentPrice {
                        Text("Current Price: $\(price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                }
                .padding()
            }
            .navigationTitle(coin.name)
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}


#Preview {
    CoinDetailsView(coin: Coin.mockCoin)
}
