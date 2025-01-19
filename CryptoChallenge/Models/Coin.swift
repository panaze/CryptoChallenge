//
//  Coin.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

class Coin {
    //Basic identifiable properties
    var id: String
    var symbol: String
    var name: String
    var image: String?
    
    //The main displayed info
    var currentPrice: Double?
    var marketCap: Double?
    var marketCapRank: Int?
    var totalVolume: Double?
    var high24h: Double?
    var low24h: Double?
    
    //Image Data
    var imageData: Data?
    
    //Price changes
    var priceChange24h: Double?
    var priceChangePercentage24h: Double?
    var marketCapChange24h: Double?
    var marketCapChangePercentage24h: Double?
    
    //Supply
    var ath: Double?
    var athChangePercentage: Double?
    var athDate: Date?
    var atl: Double?
    var atlChangePercentage: Double?
    var atlDate: String?
    
    //Timestamps
    var lastUpdated: String?
    
    //Additional
    var fullyDilutedValuation: Double?
    
    //Favorites
    var isFavorite: Bool = false
    
    //Initializer
    init(id: String,
         symbol: String,
         name: String,
         image: String? = nil,
         currentPrice: Double? = nil,
         marketCap: Double? = nil,
         marketCapRank: Int? = nil,
         totalVolume: Double? = nil,
         high24h: Double? = nil,
         low24h: Double? = nil,
         imageData: Data? = nil,
         priceChange24h: Double? = nil,
         priceChangePercentage24h: Double? = nil,
         marketCapChange24h: Double? = nil,
         marketCapChangePercentage24h: Double? = nil,
         ath: Double? = nil,
         athChangePercentage: Double? = nil,
         athDate: Date? = nil,
         atl: Double? = nil,
         atlChangePercentage: Double? = nil,
         atlDate: String? = nil,
         lastUpdated: String? = nil,
         fullyDilutedValuation: Double? = nil,
         isFavorite: Bool = false
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.totalVolume = totalVolume
        self.high24h = high24h
        self.low24h = low24h
        self.imageData = imageData
        self.priceChange24h = priceChange24h
        self.priceChangePercentage24h = priceChangePercentage24h
        self.marketCapChange24h = marketCapChange24h
        self.marketCapChangePercentage24h = marketCapChangePercentage24h
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.athDate = athDate
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
        self.atlDate = atlDate
        self.lastUpdated = lastUpdated
        self.fullyDilutedValuation = fullyDilutedValuation
        self.isFavorite = isFavorite
    }
}

//Mock Data for Testing and Previews
extension Coin {
    static var mockCoin: Coin {
        Coin(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
            currentPrice: 35000.0,
            marketCap: 650000000000.0,
            marketCapRank: 1,
            totalVolume: 35000000000.0,
            high24h: 36000.0,
            low24h: 34000.0,
            priceChange24h: 500.0,
            priceChangePercentage24h: 1.5,
            marketCapChange24h: 10000000000.0,
            marketCapChangePercentage24h: 1.6,
            ath: 69000.0,
            athChangePercentage: -49.3,
            athDate: Date(timeIntervalSince1970: 1636934400),
            atl: 67.81,
            atlChangePercentage: 51490.6,
            atlDate: "2013-07-05T00:00:00Z",
            lastUpdated: "2025-01-19T12:00:00Z",
            fullyDilutedValuation: 700000000000.0,
            isFavorite: true
        )
    }
}
