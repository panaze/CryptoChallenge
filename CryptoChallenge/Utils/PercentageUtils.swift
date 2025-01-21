//
//  PercentageUtils.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

/// Formats a percentage value to two decimal places, adding a '+' sign for positive values.
func formatPercentageValue(_ value: Double?) -> String {
    guard let value = value else { return "N/A" }
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    
    let formattedValue = formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    return value > 0 ? "+\(formattedValue)%" : "\(formattedValue)%"
}
