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
        accentColor: .yellow),
    Theme(
        name: "Jobs",
        emojis: ["🧑🏻‍🍳","👩🏼‍⚕️","👮🏻‍♂️","👷🏻","👩🏼‍🌾","👩🏼‍🏫","👨🏼‍🔧","👨🏼‍🔬","🧑🏽‍🚀","👨🏼‍⚖️","🧑🏼‍🚒"],
        numberOfPairsOfCardsToShow: 8,
        color: .purple,
        accentColor: .green),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐨","🐥","🐠","🐰","🦊","🐼","🦧","🐯","🦜","🐿","🐸","🐵","🦋"],
        numberOfPairsOfCardsToShow: 12,
        color: .blue,
        accentColor: .green),
    Theme(
        name: "Christmas",
        emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁","🌬"],
        numberOfPairsOfCardsToShow: 7,
        color: .green,
        accentColor: .red),
    Theme(
        name: "Food",
        emojis: ["🍏","🍐","🥥","🍍","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🥑"],
        numberOfPairsOfCardsToShow: 9,
        color: .yellow,
        accentColor: .green),
    Theme(
        name: "Sports",
        emojis: ["🚴🏼","🧗🏽‍♀️","🚣🏻","🤽🏼","🏊🏻","🏄🏽‍♀️","🧘🏻","🏇🏼","🏌🏼","🤾🏼","⛹🏼","🏋🏻‍♂️","🏂","⛷"],
        numberOfPairsOfCardsToShow: 6,
        color: .blue,
        accentColor: .yellow),
    Theme(
        name: "Flags",
        emojis: ["🇧🇷","🇨🇳","🇨🇴","🇩🇰","🇫🇷","🇩🇪","🇬🇷","🇭🇺","🇮🇪","🇮🇹","🇱🇹","🇱🇺","🇷🇺","🇳🇱", "🇹🇭", "🇻🇳", "🇵🇰"],
        numberOfPairsOfCardsToShow: 8,
        color: .orange,
        accentColor: .blue)
]


