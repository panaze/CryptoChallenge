//
//  CoinDetailsView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct CoinDetailsView: View {
    @ObservedObject var viewModel: CoinDetailViewModel
    
    @State private var selectedSegment: CoinDetailSegment = .overview
    
    var body: some View {
        ZStack{
            
            AnimatedMeshGradient()
            
            VStack(alignment: .center, spacing: 20) {
                
                RoundedImageView(imageData: viewModel.coin.imageData, fallbackURL: viewModel.coin.image, assetName: nil)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text("Current Price")
                        
                        HStack {
                            
                            if let price = viewModel.coin.currentPrice {
                                
                                Text(formatCoinValue(price,
                                                     displayMode: .row,
                                                     options: .currencyWithoutCode))
                                .font(.title)
                                .fontWeight(.bold)
                            }
                            
                            
                            HStack {
                                if let changePercentage = viewModel.coin.priceChangePercentage24h {
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
                    
                    
                    FavoritesButton(isFavorite: $viewModel.coin.isFavorite, action: {
                        viewModel.toggleFavorite()
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
                                CoinOverviewSection(coin: viewModel.coin)
                            case .details:
                                CoinDetailSection(coin: viewModel.coin)
                                
                            }
                        }
                        .transition(.opacity)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("BackgroundColor")))
                    
                    
                }
                .scrollIndicators(.hidden)
                
                
            }
        }
        .padding(.horizontal)
        .navigationTitle(viewModel.coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


enum CoinDetailSegment: String, CaseIterable {
    case overview = "Overview"
    case details = "Details"
}

/*
#Preview {
    CoinDetailsView(coin: Coin.mockCoin)
        .preferredColorScheme(.dark)
}
*/
