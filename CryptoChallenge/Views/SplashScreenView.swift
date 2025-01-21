//
//  SplashScreen.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack{
            RoundedImageView(imageData: nil, fallbackURL: nil, assetName: "Logo")
        }
        .onAppear {
            // Automatically transition to MainView after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var showSplash: Bool = true
        var body: some View {
            SplashScreenView(showSplash: $showSplash)
                .preferredColorScheme(.dark)
        }
    }
    
    return Preview()
}


