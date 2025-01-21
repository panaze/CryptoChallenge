//
//  AnimatedMeshGradient.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import SwiftUI

struct AnimatedMeshGradient: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State var appear = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0,0.0], [0.5,0.0], [1.0, 0.0],
                appear ? [0.0,0.0] : [0.0, 0.35], [0.5,0.05], appear ? [1.0,0.35] : [1.0,0.0],
                [0.0,1.0], [0.5,1.0], [1.0, 1.0],
            ],
            colors: [
                .accent, .accent, .accent,
                colorScheme == .dark ? .black : .white, colorScheme == .dark ? .black : .white, colorScheme == .dark ? .black : .white,
                colorScheme == .dark ? .black : .white, colorScheme == .dark ? .black : .white, colorScheme == .dark ? .black : .white
            ])
        .blur(radius: 50)
        .ignoresSafeArea(.all)
        .onAppear{
            withAnimation(.easeIn(duration: 8).repeatForever(autoreverses: true)) {
                appear.toggle()
            }
        }
    }
}

#Preview {
    AnimatedMeshGradient()
        .preferredColorScheme(.dark)
}
