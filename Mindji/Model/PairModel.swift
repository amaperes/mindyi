//
//  PairModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

struct PairModel<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var score: Int = 0
    
    var numberOfPairsOfCardsMatched: Int = 0
    
    var gameOver: Bool = false
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = cardContent(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: index*2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func chooseCard(card: Card) {
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                cards[potentialMatchIndex].numberOfTwists += 1
                cards[chosenIndex].numberOfTwists += 1
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    numberOfPairsOfCardsMatched += 2
                    if numberOfPairsOfCardsMatched == cards.count {
                        gameOver = true
                    }
                } else if cards[potentialMatchIndex].numberOfTwists > 1 && cards[chosenIndex].numberOfTwists > 1{
                    score -= 2

                } else if cards[potentialMatchIndex].numberOfTwists > 1 || cards[chosenIndex].numberOfTwists > 1 {
                    score -= 1
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                
            }
        }
        print(score)
    }
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var numberOfTwists: Int = 0
    }
}
