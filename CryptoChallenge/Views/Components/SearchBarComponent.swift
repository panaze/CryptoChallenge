//
//  SearchBarComponent.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct SearchBarComponent: View {
    @Binding var text: String
    var placeholder: String = "Search coins"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemGray6)))
        .padding(.horizontal)
    }
}


#Preview {
    struct Preview: View {
        @State var text: String = ""
        var body: some View {
            SearchBarComponent(text: $text)
        }
    }
    
    return Preview()
}
   
