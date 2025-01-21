//
//  RoundedImageView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI

struct RoundedImageView: View {
    let imageData: Data?
    let fallbackURL: String?
    let assetName: String?
    
    var body: some View {
        if let assetName = assetName {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        } else if let data = imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        } else if let url = fallbackURL {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                    
                case .empty:
                    ProgressView()
                        .backgroundStyle(.black)
                case .success(let image):
                    image.resizable().scaledToFit()
                        .background(.white)
                default:
                    NotAvailableView()
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }
    }
}
#Preview {
    Group{
        RoundedImageView(imageData: nil, fallbackURL: nil, assetName: "Logo")
        RoundedImageView(imageData: Coin.mockCoin.imageData, fallbackURL:  Coin.mockCoin.image, assetName: nil)
        
    }
    .preferredColorScheme(.dark)
    
}
