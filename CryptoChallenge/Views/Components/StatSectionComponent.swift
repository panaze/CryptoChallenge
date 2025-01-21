//
//  StatSectionComponent.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

// StatSectionComponent.swift
import SwiftUI

struct StatSectionComponent: View {
    let title: String
    let items: [StatItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            ForEach(items) { item in
                HStack {
                    Text(item.label)
                        .font(.subheadline)
                    Spacer()
                    Text(item.value)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(color(for: item))
                }
            }
        }
    }
    
    // Helper function to determine color based on percentage
    private func color(for item: StatItem) -> Color {
        guard item.isPercentage, let changePercentage = item.changePercentage else {
            return .primary
        }
        if changePercentage > 0 {
            return .green
        } else if changePercentage < 0 {
            return .red
        } else {
            return .gray
        }
    }
}

struct StatItem: Identifiable {
    let id = UUID()
    let label: String
    let value: String
    let isPercentage: Bool
    let changePercentage: Double?
}


#Preview {
    StatSectionComponent(
        title: "Key Market Stats",
        items: [
            StatItem(label: "Rank", value: "#1", isPercentage: false, changePercentage: nil),
            StatItem(label: "Market Cap", value: "$2,000,000,000", isPercentage: false, changePercentage: nil),
            StatItem(label: "Total Volume", value: "$500,000,000", isPercentage: false, changePercentage: nil)
        ]
    )
    .preferredColorScheme(.dark)
}

