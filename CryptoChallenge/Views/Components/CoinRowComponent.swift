//
//  CoinRowView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct CoinRowComponent: View {
    @Environment(\.modelContext) private var context
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
                        .clipShape(Circle())
                        .frame(width: 32, height: 32)
                        
                } else {
                    // Download on the fly
                    AsyncImage(url: URL(string: coin.image ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .clipShape(Circle())
                                .frame(width: 32, height: 32)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 32, height: 32)
                                .onAppear {
                                    Task {
                                        if let url = URL(string: coin.image ?? ""),
                                           let (downloadedData, _) = try? await URLSession.shared.data(from: url) {
                                            coin.imageData = downloadedData
                                            try? context.save()
                                        }
                                    }
                                }
                            
                        default:
                            NotAvailableView()
                            
                        }
                    }
                    .clipShape(Circle())
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
                    Text(formatCoinValue(price,
                                         displayMode: .row,
                                         options: .currencyWithoutCode))
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
        .preferredColorScheme(.dark)
}
