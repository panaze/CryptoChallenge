//
//  PriceUtils.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

enum DisplayPriceMode {
    case row    // Compact format for list/table views
    case detail // Detailed format with more precision
}

struct CurrencyFormatOptions {
    let isCurrency: Bool
    let showCurrencyCode: Bool
    
    static let currency = CurrencyFormatOptions(isCurrency: true, showCurrencyCode: true)
    static let currencyWithoutCode = CurrencyFormatOptions(isCurrency: true, showCurrencyCode: false)
    static let numeric = CurrencyFormatOptions(isCurrency: false, showCurrencyCode: false)
}

// Formats a numeric value according to display mode and currency options.
// Row mode: Compact format with abbreviations (e.g., $24M, $35.6M USD)
// Detail mode: Full format with more precision (e.g., $24,000,000.00 USD)

func formatCoinValue(
    _ value: Double?,
    displayMode: DisplayPriceMode,
    options: CurrencyFormatOptions = .numeric
) -> String {
    guard let value = value else { return "N/A" }
    
    let formatter = NumberFormatter()
    let prefix = options.isCurrency ? "$" : ""
    let suffix = options.isCurrency && options.showCurrencyCode ? " USD" : ""
    
    // Handle detail mode differently - always show full numbers
    if case .detail = displayMode {
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 8
        formatter.usesGroupingSeparator = true
        let formatted = formatter.string(from: NSNumber(value: value)) ?? String(format: "%.2f", value)
        return "\(prefix)\(formatted)\(suffix)"
    }
    
    // Row mode formatting
    if abs(value) >= 1_000_000_000 {
        let billions = value / 1_000_000_000
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0  // Don't show unnecessary decimals
        formatter.maximumFractionDigits = 2
        let formatted = formatter.string(from: NSNumber(value: billions)) ?? String(format: "%.2f", billions)
        return "\(prefix)\(formatted)B\(suffix)"
    } else if abs(value) >= 1_000_000 {
        let millions = value / 1_000_000
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0  // Don't show unnecessary decimals
        formatter.maximumFractionDigits = 2
        let formatted = formatter.string(from: NSNumber(value: millions)) ?? String(format: "%.2f", millions)
        return "\(prefix)\(formatted)M\(suffix)"
    }
    
    // Handle small values in row mode
    if abs(value) < 0.001, value != 0 {
        formatter.numberStyle = .scientific
        formatter.maximumSignificantDigits = 3
        formatter.exponentSymbol = "e"
        let formatted = formatter.string(from: NSNumber(value: value)) ?? String(value)
        return "\(prefix)\(formatted)\(suffix)"
    }
    
    // Regular decimal formatting for row mode
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    let formatted = formatter.string(from: NSNumber(value: value)) ?? String(format: "%.2f", value)
    return "\(prefix)\(formatted)\(suffix)"
}
