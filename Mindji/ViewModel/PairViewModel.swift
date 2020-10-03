//
//  PairViewModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

class PairViewModel: ObservableObject {

    @Published private var pairModel: PairModel<String>
    
    private(set) var theme: Theme = themes.randomElement()!

    private static func createPairModel(with theme: Theme) -> PairModel<String> {
        let emojis: [String] = theme.emojis.shuffled()

        return PairModel<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow ?? Int.random(in: 4..<emojis.count-1)) { index in
            return emojis[index]
        }
    }
    
    init() {
       pairModel = PairViewModel.createPairModel(with: theme)
    }

    //MARK: - Access to the Model
    
    var cards: Array<PairModel<String>.Card> {
        pairModel.cards
    }
    
    var score: Int {
        pairModel.score
    }
    
    var gameOver: Bool {
        pairModel.gameOver
    }
    
    //MARK: - Intents from the View

    func chooseCard(card: PairModel<String>.Card) {
        pairModel.chooseCard(card: card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        pairModel = PairViewModel.createPairModel(with: theme)
    }
}
