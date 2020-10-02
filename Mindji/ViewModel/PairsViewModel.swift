//
//  PairsViewModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

class PairsViewModel: ObservableObject {

    @Published private var pairsModel: PairModel<String>
    
    var theme: Theme = themes.randomElement()!

    static func createPairsModel(theme: Theme) -> PairModel<String> {
        let emojis: [String] = theme.emojis.shuffled()

        return PairModel<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow ?? Int.random(in: 4..<emojis.count-1)) { index in
            return emojis[index]
        }
    }
    
    init() {
       pairsModel = PairsViewModel.createPairsModel(theme: theme)
    }
        
    //MARK: - Access to the Model
    
    var cards: Array<PairModel<String>.Card> {
        pairsModel.cards
    }
    
    var score: Int {
        pairsModel.score
    }
    
    var gameOver: Bool {
        pairsModel.gameOver
    }
    
    //MARK: - Intents from UI

    func chooseCard(card: PairModel<String>.Card) {
        pairsModel.chooseCard(card: card)        
    }
    
    func newGame() {
        theme = themes.randomElement()!
        pairsModel = PairsViewModel.createPairsModel(theme: theme)
    }
}
