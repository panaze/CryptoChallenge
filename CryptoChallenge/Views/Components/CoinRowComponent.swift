//
//  CoinRowView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct CoinRowComponent: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            
            HStack(spacing: 15) {
                // If we have imageData, display it.
                // Otherwise, attempt to load from the network, store in coin.imageData once fetched.
                if let data = coin.imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                } else {
                    // Download on the fly
                    AsyncImage(url: URL(string: coin.image ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.red)
                            
                        default:
                            // .empty or .placeholder
                            ProgressView()
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.headline)
                    Text(coin.symbol.uppercased())
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            
            VStack(alignment: .trailing) {
                if let price = coin.currentPrice {
                    Text("$\(formatCoinValue(price, displayMode: .row))")
                        .font(.headline)
                }
                
                if let changePercentage = coin.priceChangePercentage24h {
                    Text(formatPercentageValue(changePercentage))
                        .foregroundColor(changePercentage > 0 ? .green : (changePercentage < 0 ? .red : .gray))
                        .fontWeight(.light)
                        .font(.subheadline)
                }
                
            }
            
        }
    }
}


#Preview {
    CoinRowComponent(coin: Coin.mockCoin)
}
