//
//  PairsView.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct PairsView: View {
    @ObservedObject var pairsViewModel: PairsViewModel
    
    var body: some View {
        Grid(pairsViewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.pairsViewModel.chooseCard(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.green)
    }
}

struct CardView: View {
    var card: PairsModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
       // .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    
    //MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 2.5
    //let aspectRatio: CGFloat = 2/3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.5
    }
    
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PairsView(pairsViewModel: PairsViewModel())
    }
}
