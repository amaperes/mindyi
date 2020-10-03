//
//  PairModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

struct PairModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    private var twistedCards = Set<Int>()
    private var numberOfPairsOfCardsMatched = 0
    private(set) var gameOver = false
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = cardContent(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: index*2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
           get { cards.indices.filter { cards[$0].isFaceUp }.only }
           set {
               for index in cards.indices {
                   cards[index].isFaceUp = (index == newValue)
               }
           }
       }
    
    mutating func chooseCard(card: Card) {
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    numberOfPairsOfCardsMatched += 2
                    if numberOfPairsOfCardsMatched == cards.count {
                        gameOver = true
                    }
                } else {
                    if twistedCards.contains(cards[chosenIndex].id) {
                        score -= 1
                    }
                    if twistedCards.contains(cards[potentialMatchIndex].id) {
                        score -= 1
                    }
                    twistedCards.insert(cards[chosenIndex].id)
                    twistedCards.insert(cards[potentialMatchIndex].id)
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
