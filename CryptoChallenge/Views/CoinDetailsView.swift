//
//  CoinDetailsView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    let news: [NewsArticle] = NewsArticle.mockNewsArray
    
    @State private var selectedSegment: CoinDetailSegment = .overview
    @State private var isFavorite: Bool = true
    @State private var internet: Bool = true
    
    var body: some View {
        ZStack{
            
            AnimatedMeshGradient()
            
            VStack(alignment: .center, spacing: 20) {
                
                RoundedImageView(imageData: coin.imageData, fallbackURL: coin.image, assetName: nil)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text("Current Price")
                        
                        HStack {
                            
                            if let price = coin.currentPrice {
                                
                                Text(formatCoinValue(price,
                                                     displayMode: .row,
                                                     options: .currencyWithoutCode))
                                .font(.title)
                                .fontWeight(.bold)
                            }
                            
                            
                            HStack {
                                if let changePercentage = coin.priceChangePercentage24h {
                                    Text("\(formatPercentageValue(changePercentage))")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                }
                                
                                
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.accentColor, lineWidth: 0.5)
                            )
                            
                            Spacer()
                        }
                        
                    }
                    
                    Spacer()
                    
                    FavoritesButton(isFavorite: $isFavorite, action: {
                        print("Here goes the ViewModel action to toggle!")
                    })
                    
                }
                
                ScrollView {
                    VStack(alignment: .leading){
                        HStack(spacing: 0) {
                            ForEach(CoinDetailSegment.allCases, id: \.self) { segment in
                                Button(action: {
                                    withAnimation(.smooth) {
                                        selectedSegment = segment
                                    }
                                }) {
                                    Text(segment.rawValue)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 12)
                                        .frame(maxWidth: .infinity)
                                        .background(selectedSegment == segment ? Color.accentColor : Color.clear)
                                        .foregroundColor(selectedSegment == segment ? Color.black : Color.gray)
                                        .clipShape(
                                            .rect(
                                                topLeadingRadius: segment == .overview ? 10 : 0,
                                                bottomLeadingRadius: segment == .overview ? 10 : 0,
                                                bottomTrailingRadius: segment == .details ? 10 : 0,
                                                topTrailingRadius: segment == .details ? 10 : 0
                                            )
                                        )
                                        .overlay(
                                            UnevenRoundedRectangle(
                                                topLeadingRadius: segment == .overview ? 10 : 0,
                                                bottomLeadingRadius: segment == .overview ? 10 : 0,
                                                bottomTrailingRadius: segment == .details ? 10 : 0,
                                                topTrailingRadius: segment == .details ? 10 : 0
                                            )
                                            .stroke(selectedSegment == segment ? Color.accentColor : Color.gray, lineWidth: 1)
                                            .opacity(selectedSegment == segment ? 1 : 0.5)
                                        )
                                }
                                .controlSize(.small)
                                
                            }
                        }
                        .padding(.bottom)
                        
                        // Content based on selected segment
                        Group {
                            switch selectedSegment {
                            case .overview:
                                CoinOverviewSection(coin: coin)
                            case .details:
                                CoinDetailSection(coin: coin)
                                
                            }
                        }
                        .transition(.opacity)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("BackgroundColor")))
                    
                    
                    if internet == true {
                        VStack(alignment: .leading){
                            Text("Related News")
                                .font(.title2)
                                .bold()
                            
                            
                            ForEach(news) { article in
                                NewsArticleRowView(article: article)
                                    .padding(.top, 4)
                                    .onTapGesture {
                                        if let urlStr = article.url,
                                           let url = URL(string: urlStr) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("BackgroundColor")))
                    }
                    
                }
                .scrollIndicators(.hidden)
                
                
            }
        }
        .padding(.horizontal)
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


enum CoinDetailSegment: String, CaseIterable {
    case overview = "Overview"
    case details = "Details"
}

#Preview {
    CoinDetailsView(coin: Coin.mockCoin)
        .preferredColorScheme(.dark)
}
