//
//  TabButtonComponent.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//
import SwiftUI

struct TabButtonComponent: View {
    let title: String
    let iconName: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(isSelected ? .black : .white)
                    .fontWeight(isSelected ? .bold : .medium)
                
                
                if isSelected {
                    Text(title)
                        .foregroundColor(isSelected ? .black : .white)
                        .fontWeight(isSelected ? .bold : .medium)
                        .transition(.opacity.combined(with: .scale))
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(isSelected ? Color.accentColor : Color.clear)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.accentColor : Color.gray, lineWidth: 0.5)
            )
        }
        .controlSize(.small)
        .animation(.easeInOut(duration: 0.3), value: isSelected)
    }
}

#Preview {
    struct Preview: View {
        @State private var selectedIndex: Int = 0

        var body: some View {
            HStack(spacing: 10) {
                TabButtonComponent(title: "All", iconName: "globe", isSelected: selectedIndex == 0) {
                    selectedIndex = 0
                }

                TabButtonComponent(title: "Favorites", iconName: "star.fill", isSelected: selectedIndex == 1) {
                    selectedIndex = 1
                }

                TabButtonComponent(title: "Price %", iconName: "chart.line.uptrend.xyaxis", isSelected: selectedIndex == 2) {
                    selectedIndex = 2
                }
            }
            .padding()
        }
    }
    return Preview()
}
