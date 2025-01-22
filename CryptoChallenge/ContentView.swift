//
//  ContentView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 18/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    // We'll store our main view model as a StateObject so it persists
    @StateObject private var viewModel: CoinListViewModel
    
    // Network monitoring only in ContentView
    @StateObject private var networkMonitor = NetworkMonitor()
    
    @State private var displayMode: CoinListView.DisplayMode = .all
    
    init() {
        // If ModelContainer(for:) throws, handle it safely:
        do {
            let container = try ModelContainer(for: Coin.self)
            let dummyContext = ModelContext(container)
            _viewModel = StateObject(
                wrappedValue: CoinListViewModel(context: dummyContext)
            )
        } catch {
            // If container creation fails, decide how to handle.
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                AnimatedMeshGradient()
                
                VStack(alignment: .leading) {
                    
                    //SEARCH BAR
                    SearchBarComponent(text: $viewModel.searchText)
                    
                    
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
                            
                            Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
                                .foregroundColor(networkMonitor.isConnected ? .green : .red)
                                .animation(.easeInOut(duration: 0.3), value: networkMonitor.isConnected)
                            
                            if let date = viewModel.lastUpdated {
                                Text("Last updated\n \(DateUtils.format(date))")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    
                    //LIST OF COINS
                    CoinListView(viewModel: viewModel, displayMode: $displayMode)
                        .refreshable {
                            if networkMonitor.isConnected {
                                await viewModel.fetchCoins()
                            }
                        }
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .clear, location: 0.0),
                                    .init(color: .black, location: 0.02),
                                    .init(color: .black, location: 0.98),
                                    .init(color: .clear, location: 1.0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .safeAreaPadding(.top, 10)
                        .scrollIndicators(.hidden)
                        .scrollContentBackground(.hidden)
                        .navigationTitle("Explore")
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                
                
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? ""),
                    dismissButton: .default(Text("OK")) {
                        viewModel.errorMessage = nil
                    }
                )
            }
            
        }
        .onAppear{
            // Reassign actual context from environment
            viewModel.context = context
            
            
            // Optionally skip fetch if offline
            if networkMonitor.isConnected {
                Task {
                    await viewModel.fetchCoins()
                }
            } else {
                print("Skipping fetch because offline")
            }
            
        }
    }
}

/*
 #Preview {
 ContentView(coins: Coin.mockCoins)
 .preferredColorScheme(.dark)
 }
 */
