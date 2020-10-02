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
    let accentColor: Color
    
}

let themes: [Theme] = [
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🍬","🍭","👁","🕸","🥧","🕯","🧟‍♀️"],
        color: .orange,
        accentColor: .red),
    Theme(
        name: "Jobs",
        emojis: ["🧑🏻‍🍳","👩🏼‍⚕️","👮🏻‍♂️","👷🏻","👩🏼‍🌾","👩🏼‍🏫","👨🏼‍🔧","👨🏼‍🔬","🧑🏽‍🚀","👨🏼‍⚖️","🧑🏼‍🚒"],
        numberOfPairsOfCardsToShow: 8,
        color: .blue,
        accentColor: .red),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐨","🐥","🐠","🐰","🦊","🐼","🦧","🐯","🦜","🐿","🐸","🐵","🦋"],
        numberOfPairsOfCardsToShow: 12,
        color: .yellow,
        accentColor: .red),
    Theme(
        name: "Christmas",
        emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁","🌬"],
        numberOfPairsOfCardsToShow: 7,
        color: .red,
        accentColor: .red),
    Theme(
        name: "Food",
        emojis: ["🍏","🍐","🥥","🍍","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🥑"],
        numberOfPairsOfCardsToShow: 9,
        color: .purple,
        accentColor: .red),
    Theme(
        name: "Sports",
        emojis: ["🚴🏼","🧗🏽‍♀️","🚣🏻","🤽🏼","🏊🏻","🏄🏽‍♀️","🧘🏻","🏇🏼","🏌🏼","🤾🏼","⛹🏼","🏋🏻‍♂️","🏂","⛷"],
        numberOfPairsOfCardsToShow: 6,
        color: .pink,
        accentColor: .red),
    Theme(
        name: "Flags",
        emojis: ["🇧🇷","🇨🇳","🇨🇴","🇩🇰","🇫🇷","🇩🇪","🇬🇷","🇭🇺","🇮🇪","🇮🇹","🇱🇹","🇱🇺","🇷🇺","🇳🇱", "🇹🇭", "🇻🇳", "🇵🇰"],
        numberOfPairsOfCardsToShow: 8,
        color: .green,
        accentColor: .red)
]


