//
//  PriceUtils.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

enum DisplayPriceMode {
    case row
    case detail
}

/// Formats a coin-related numeric value according to whether
/// it is displayed in a row or in a detail view.
func formatCoinValue(_ value: Double?, displayMode: DisplayPriceMode) -> String {
    guard let value = value else { return "N/A" }

    switch displayMode {
    case .row:
        // For extremely small prices, show scientific notation (e.g. 2.262e-05).
        // Otherwise, show two decimals (e.g. 1.00, 12000.00).
        if abs(value) < 0.001, value != 0 {
            // Scientific notation
            let formatter = NumberFormatter()
            formatter.numberStyle = .scientific
            formatter.maximumSignificantDigits = 3
            formatter.exponentSymbol = "e"
            return formatter.string(from: NSNumber(value: value)) ?? String(value)
        } else {
            // Always show two decimals
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber(value: value)) ?? String(format: "%.2f", value)
        }

    case .detail:
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? String(format: "%.2f", value)
    }
}
