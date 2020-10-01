//
//  ContentView.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct PairsView: View {
    var pairsViewModel: PairsViewModel
    
    var body: some View {
        let font = pairsViewModel.cards.count < 10 ?  Font.largeTitle : Font.title

        return HStack() {
            ForEach(pairsViewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.pairsViewModel.chooseCard(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
            .padding()
            .foregroundColor(Color.green)
            .font(font)
    }
}

struct CardView: View {
    var card: PairsModel<String>.Card
    
    var body: some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 15).fill(Color.white)
                RoundedRectangle(cornerRadius: 15).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 15).fill()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PairsView(pairsViewModel: PairsViewModel())
    }
}
