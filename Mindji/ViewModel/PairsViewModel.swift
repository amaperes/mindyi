//
//  PairsViewModel.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import Foundation

class PairsViewModel {
    private var pairsModel: PairsModel<String> = PairsViewModel.createPairsModel()
    
    static func createPairsModel() -> PairsModel<String> {
        let emojis = ["🤪", "🥺", "😱"]
        return PairsModel<String>(numberOfPairsOfCards: 3) { index in
            return emojis[index]
        }
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
