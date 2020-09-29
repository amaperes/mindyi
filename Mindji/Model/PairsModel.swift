//
//  PairsModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

struct PairsModel<CardContent> {
    var cards: Array<Card> = Array<Card>()
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        for index in 0..<numberOfPairsOfCards {
            let content = cardContent(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: index*2 + 1, content: content))
        }
    }
    
    func chooseCard(card: Card) {
        print("Card tapped \(card)")
    }
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
