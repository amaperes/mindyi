//
//  Cardify.swift
//  Mindji
//
//  Created by Antonela Madalina on 03/10/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var gradient: Gradient

    init(isFaceUp: Bool, gradient: Gradient) {
        rotation = isFaceUp ? 0 : 180
        self.gradient = gradient
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))

    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2.5
}

extension View {
    func cardify(isFaceUp: Bool, gradient: Gradient) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, gradient: gradient))
    }
}
