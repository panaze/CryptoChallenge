//
//  DateUitls.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

struct DateUtils {
    private static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    private static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withTimeZone, .withFractionalSeconds]
        return formatter
    }()
    
    static func format(isoString: String, toFormat: String = "dd MMM HH:mm") -> String? {
        guard let date = isoFormatter.date(from: isoString) else {
            print("Failed to parse ISO string: \(isoString)")
            return nil
        }
        shared.dateFormat = toFormat
        return shared.string(from: date)
    }
    
    // For Date objects
    static func format(_ date: Date, format: String = "dd MMM HH:mm") -> String {
        shared.dateFormat = format
        return shared.string(from: date)
    }
}
