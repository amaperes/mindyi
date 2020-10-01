//
//  PairsViewModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

class PairsViewModel: ObservableObject {

    @Published private var pairsModel: PairsModel<String>
        
    
    var theme: Theme = themes.randomElement()!

    static func createPairsModel(theme: Theme) -> PairsModel<String> {
        let emojis: [String] = theme.emojis.shuffled()

        return PairsModel<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow ?? Int.random(in: 4..<emojis.count-1)) { index in
            return emojis[index]
        }
    }
    
    init() {
       pairsModel = PairsViewModel.createPairsModel(theme: theme)
    }
        
    //MARK: - Access to the Model
    
    var cards: Array<PairsModel<String>.Card> {
        pairsModel.cards
    }
    
    //MARK: - Intents from UI

    func chooseCard(card: PairsModel<String>.Card) {
        pairsModel.chooseCard(card: card)        
    }
}
