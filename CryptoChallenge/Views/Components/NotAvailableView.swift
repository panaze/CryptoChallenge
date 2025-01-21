//
//  NotAvailableView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//

import SwiftUI

struct NotAvailableView: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay(
                Image(systemName: "xmark")
                    .font(.caption)
                    .foregroundColor(.gray)
            )
    }
}


#Preview {
    NotAvailableView()
        .preferredColorScheme(.dark)
}
