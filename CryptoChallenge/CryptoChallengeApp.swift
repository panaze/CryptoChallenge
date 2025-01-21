//
//  CryptoChallengeApp.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI
import SwiftData

@main
struct CryptoChallengeApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView(showSplash: $showSplash)
                    .preferredColorScheme(.dark)
            } else {
                ContentView()
                    .modelContainer(for: [Coin.self, NewsArticle.self])
                    .preferredColorScheme(.dark)
            }
        }
    }
    
}
