//
//  CoinDetailSectionView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI

struct CoinDetailSection: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            StatSectionComponent(
                title: "All Time Stats",
                items: [
                    StatItem(
                        label: "All Time High",
                        value: formatCoinValue(coin.ath ?? 0, displayMode: .row, options: .currency),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "All Time High Change %",
                        value: "\(formatPercentageValue(coin.athChangePercentage ?? 0))",
                        isPercentage: true,
                        changePercentage: coin.athChangePercentage
                    ),
                    StatItem(
                        label: "All Time Low",
                        value: formatCoinValue(coin.atl ?? 0, displayMode: .row, options: .currency),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "All Time Low Change %",
                        value: "\(formatPercentageValue(coin.atlChangePercentage ?? 0))",
                        isPercentage: true,
                        changePercentage: coin.atlChangePercentage
                    )
                ]
            )
            
            StatSectionComponent(
                title: "Market Cap Changes (24h)",
                items: [
                    StatItem(
                        label: "Market Cap Change",
                        value: formatCoinValue(coin.marketCapChange24h ?? 0, displayMode: .row, options: .currency),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Market Cap Change %",
                        value: "\(formatPercentageValue(coin.marketCapChangePercentage24h ?? 0))",
                        isPercentage: true,
                        changePercentage: coin.marketCapChangePercentage24h
                    )
                ]
            )
            
            StatSectionComponent(
                title: "Supply",
                items: [
                    StatItem(
                        label: "Circulating Supply",
                        value: formatCoinValue(coin.circulatingSupply ?? 0, displayMode: .row, options: .numeric),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Total Supply",
                        value: formatCoinValue(coin.totalSupply ?? 0, displayMode: .row, options: .numeric),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Max Supply",
                        value: formatCoinValue(coin.maxSupply ?? 0, displayMode: .row, options: .numeric),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                ]
            )
            
            StatSectionComponent(
                title: "Additional Information",
                items: [
                    StatItem(
                        label: "Fully Diluted Valuation",
                        value: formatCoinValue(coin.fullyDilutedValuation ?? 0, displayMode: .row, options: .currency),
                        isPercentage: false,
                        changePercentage: nil
                    ),
                    StatItem(
                        label: "Last Updated",
                        value: DateUtils.format(isoString: coin.lastUpdated ?? "") ?? "N/A",
                        isPercentage: false,
                        changePercentage: nil
                    )
                ]
            )
        }
    }
}
#Preview {
    CoinDetailSection(coin: Coin.mockCoin)
        .preferredColorScheme(.dark)
}
