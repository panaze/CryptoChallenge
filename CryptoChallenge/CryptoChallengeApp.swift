//
//  CryptoChallengeApp.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI

@main
struct CryptoChallengeApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView(showSplash: $showSplash)
                    .preferredColorScheme(.dark)
            } else {
                ContentView(coins: Coin.mockCoins)
                    .preferredColorScheme(.dark)
            }
            
        }
    }
}
