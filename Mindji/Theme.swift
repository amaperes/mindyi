//
//  CustomizeCustomizeTheme.swift
//  Mindji
//
//  Created by Antonela Madalina on 01/10/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct Theme {
    let name: String
    var emojis: [String]
    var numberOfPairsOfCardsToShow: Int?
    let color: Color
}

let themes: [Theme] = [
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🍬","🍭","👁","🕸","🥧","🕯","🧟‍♀️"],
        color: .orange),
    Theme(
        name: "Jobs",
        emojis: ["🧑🏻‍🍳","👩🏼‍⚕️","👮🏻‍♂️","👷🏻","👩🏼‍🌾","👩🏼‍🏫","👨🏼‍🔧","👨🏼‍🔬","🧑🏽‍🚀","👨🏼‍⚖️","🧑🏼‍🚒"],
        numberOfPairsOfCardsToShow: 8,
        color: .blue),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐨","🐥","🐠","🐰","🦊","🐼","🦧","🐯","🦜","🐿","🐸","🐵","🦋"],
        numberOfPairsOfCardsToShow: 12,
        color: .yellow),
    Theme(
        name: "Christmas",
        emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁","🌬"],
        numberOfPairsOfCardsToShow: 7,
        color: .red),
    Theme(
        name: "Food",
        emojis: ["🍏","🍐","🥥","🍍","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🥑"],
        numberOfPairsOfCardsToShow: 9,
        color: .purple),
    Theme(
        name: "Sports",
        emojis: ["🚴🏼","🧗🏽‍♀️","🚣🏻","🤽🏼","🏊🏻","🏄🏽‍♀️","🧘🏻","🏇🏼","🏌🏼","🤾🏼","⛹🏼","🏋🏻‍♂️","🏂","⛷"],
        numberOfPairsOfCardsToShow: 6,
        color: .pink),
    Theme(
        name: "Flags",
        emojis: ["🇧🇷","🇨🇳","🇨🇴","🇩🇰","🇫🇷","🇩🇪","🇬🇷","🇭🇺","🇮🇪","🇮🇹","🇱🇹","🇱🇺","🇷🇺","🇳🇱", "🇹🇭", "🇻🇳", "🇵🇰"],
        numberOfPairsOfCardsToShow: 8,
        color: .green)
]


