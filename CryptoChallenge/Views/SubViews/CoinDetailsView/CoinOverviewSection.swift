//
//  CoinOverviewSection.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//
import SwiftUI

struct CoinOverviewSection: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            StatSectionComponent(
                title: "Key Market Stats",
                items: [
                    StatItem(
                        label: "Rank",
                        value: "#\(coin.marketCapRank ?? 0)",
                        iconName: "number.circle",
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Market Cap",
                        value: formatCoinValue(coin.marketCap ?? 0, displayMode: .row, options: .currency),
                        iconName: "chart.bar.fill",
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Total Volume",
                        value: formatCoinValue(coin.totalVolume ?? 0, displayMode: .row, options: .currency),
                        iconName: "waveform.path.ecg",
                        isPercentage: false,
                        changePercentage: nil
                    )
                ]
            )
            
            StatSectionComponent(
                title: "Price Range (24h)",
                items: [
                    StatItem(
                        label: "High",
                        value: formatCoinValue(coin.high24h ?? 0, displayMode: .detail, options: .currency),
                        iconName: "arrow.up",
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Low",
                        value: formatCoinValue(coin.low24h ?? 0, displayMode: .detail, options: .currency),
                        iconName: "arrow.down",
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Price Change",
                        value: formatCoinValue(coin.priceChange24h ?? 0, displayMode: .row, options: .currency),
                        iconName: "arrow.left.and.right",
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Price Change",
                        value: "\(formatPercentageValue(coin.priceChangePercentage24h ?? 0))",
                        iconName: "percent",
                        isPercentage: true,
                        changePercentage: coin.priceChangePercentage24h
                    )
                ]
            )
        }
    }
}


#Preview {
    CoinOverviewSection(coin: Coin.mockCoin)
        .preferredColorScheme(.dark)
}
