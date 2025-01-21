//
//  FavoriteButtonComponent.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI

struct FavoritesButton: View {
    @Binding var isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .font(.title)
                .foregroundColor(isFavorite ? .accent : .gray)
        }
    }
}


#Preview {
    struct Preview: View {
        @State var isFavorite: Bool = false
        var body: some View {
            FavoritesButton(isFavorite: $isFavorite, action: {
                print("Button tapped!")
            })
            .preferredColorScheme(.dark)
        }
    }
    return Preview()
}
