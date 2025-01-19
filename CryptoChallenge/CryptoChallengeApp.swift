//
//  CryptoChallengeApp.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI

@main
struct CryptoChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coins: Coin.mockCoins)
        }
    }
}
