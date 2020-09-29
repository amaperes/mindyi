//
//  ContentView.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var pairsViewModel: PairsViewModel
    
    var body: some View {
        return HStack() {
            ForEach(pairsViewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.pairsViewModel.chooseCard(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.green)
            .font(Font.largeTitle)
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
        ContentView(pairsViewModel: PairsViewModel())
    }
}
