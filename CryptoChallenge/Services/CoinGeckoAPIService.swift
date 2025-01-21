//
//  CoinGeckoAPIService.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import Foundation

final class CoinGeckoService {
    private let baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    private let session = URLSession.shared

    func fetchCoins() async throws -> [Coin] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "per_page", value: "20")
        ]
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(from: url)

        //Ensure response is OK
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        //Decode into DTO
        let decoded = try JSONDecoder().decode([CoinDTO].self, from: data)
        /*
        print("Decoded CoinGecko Response:")
        for coin in decoded {
            print("""
            ---
            ID: \(coin.id)
            Symbol: \(coin.symbol)
            Name: \(coin.name)
            Current Price: \(coin.current_price)
            Market Cap: \(coin.market_cap)
            Market Cap Rank: \(coin.market_cap_rank)
            Total Volume: \(coin.total_volume)
            High (24h): \(coin.high_24h ?? 0)
            Low (24h): \(coin.low_24h ?? 0)
            Price Change (24h): \(coin.price_change_24h ?? 0)
            Price Change Percentage (24h): \(coin.price_change_percentage_24h ?? 0)
            Last Updated: \(coin.last_updated ?? "N/A")
            """)
        }
        */
        
        let coins = decoded.map { dto in
            Coin(
                id: dto.id,
                symbol: dto.symbol,
                name: dto.name,
                image: dto.image,
                currentPrice: dto.current_price,
                marketCap: dto.market_cap,
                marketCapRank: dto.market_cap_rank,
                totalVolume: dto.total_volume,
                high24h: dto.high_24h,
                low24h: dto.low_24h,
                priceChange24h: dto.price_change_24h,
                priceChangePercentage24h: dto.price_change_percentage_24h,
                marketCapChange24h: dto.market_cap_change_24h,
                marketCapChangePercentage24h: dto.market_cap_change_percentage_24h,
                circulatingSupply: dto.circulating_supply,
                totalSupply: dto.total_supply,
                maxSupply: dto.max_supply,
                ath: dto.ath,
                athChangePercentage: dto.ath_change_percentage,
                athDate: dto.ath_date,
                atl: dto.atl,
                atlChangePercentage: dto.atl_change_percentage,
                atlDate: dto.atl_date,
                lastUpdated: dto.last_updated,
                fullyDilutedValuation: dto.fully_diluted_valuation
            )
        }
        return coins
    }
}

private struct CoinDTO: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap: Double
    let market_cap_rank: Int
    let fully_diluted_valuation: Double?
    let total_volume: Double
    let high_24h: Double?
    let low_24h: Double?
    let price_change_24h: Double?
    let price_change_percentage_24h: Double?
    let market_cap_change_24h: Double?
    let market_cap_change_percentage_24h: Double?
    let circulating_supply: Double?
    let total_supply: Double?
    let max_supply: Double?
    let ath: Double?
    let ath_change_percentage: Double?
    let ath_date: String?
    let atl: Double?
    let atl_change_percentage: Double?
    let atl_date: String?
    let last_updated: String?

}
