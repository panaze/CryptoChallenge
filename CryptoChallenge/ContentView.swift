//
//  ContentView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State var text: String = ""
    @State private var displayMode: CoinListView.DisplayMode = .all
    @State private var wifi: Bool = true
    
    let coins: [Coin]
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                AnimatedMeshGradient()
                
                VStack(alignment: .leading) {
                    
                    //SEARCH BAR
                    SearchBarComponent(text: $text)
                    
                    
                    // TAB BAR
                    HStack(alignment: .center) {
                        
                        //TAB BUTTONS
                        HStack(spacing: 9) {
                            TabButtonComponent(
                                title: "All",
                                iconName: "globe",
                                isSelected: displayMode == .all
                            ) {
                                displayMode = .all
                            }
                            
                            TabButtonComponent(
                                title: "Favorites",
                                iconName: "star",
                                isSelected: displayMode == .favorites
                            ) {
                                displayMode = .favorites
                            }
                            
                            TabButtonComponent(
                                title: "Price %",
                                iconName: "chart.line.uptrend.xyaxis",
                                isSelected: displayMode == .priceChange
                            ) {
                                displayMode = .priceChange
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //WIFI AND FETCH INFO
                        HStack() {
                            
                            Image(systemName: wifi ? "wifi" : "wifi.slash")
                                .foregroundColor(wifi ? .green : .red)
                                .animation(.easeInOut(duration: 0.3), value: wifi)
                            
                            
                            Text("Last updated\n \(DateUtils.format(Date()))")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    
                    //LIST OF COINS
                    CoinListView(displayMode: $displayMode)
                        .scrollContentBackground(.hidden)
                        .navigationTitle("Explore")
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                
                
            }
            
        }
        
    }
}

// Display mode enumeration
enum DisplayMode {
    case all, favorites, priceChange
}

#Preview {
    ContentView(coins: Coin.mockCoins)
}
