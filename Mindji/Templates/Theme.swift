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
        accentColor: .gray),
    Theme(
        name: "Jobs",
        emojis: ["🧑🏻‍🍳","👩🏼‍⚕️","👮🏻‍♂️","👷🏻","👩🏼‍🌾","👩🏼‍🏫","👨🏼‍🔧","👨🏼‍🔬","🧑🏽‍🚀","👨🏼‍⚖️","🧑🏼‍🚒"],
        color: .purple,
        accentColor: .blue),
    Theme(
        name: "Animals",
        emojis: ["🐶","🐨","🐥","🐠","🐰","🦊","🐼","🦧","🐯","🦜","🐿","🐸","🐵","🦋"],
        numberOfPairsOfCardsToShow: 5,
        color: .red,
        accentColor: .gray),
    Theme(
        name: "Christmas",
        emojis: ["🤶🏻","🎅🏻","🎄","⛄️","☃️","❄️","🎁","🌬"],
        numberOfPairsOfCardsToShow: 7,
        color: .green,
        accentColor: .red),
    Theme(
        name: "Food",
        emojis: ["🍏","🍐","🥥","🍍","🍋","🍉","🍇","🍓","🍒","🥦","🥕","🥑"],
        numberOfPairsOfCardsToShow: 6,
        color: .gray,
        accentColor: .green),
    Theme(
        name: "Sports",
        emojis: ["🚴🏼","🧗🏽‍♀️","🚣🏻","🤽🏼","🏊🏻","🏄🏽‍♀️","🧘🏻","🏇🏼","🏌🏼","🤾🏼","⛹🏼","🏋🏻‍♂️","🏂","⛷"],
        numberOfPairsOfCardsToShow: 5,
        color: .gray,
        accentColor: .yellow),
    Theme(
        name: "Flags",
        emojis: ["🇧🇷","🇨🇳","🇨🇴","🇩🇰","🇫🇷","🇩🇪","🇬🇷","🇭🇺","🇮🇪","🇮🇹","🇱🇹","🇱🇺","🇷🇺","🇳🇱", "🇹🇭", "🇻🇳", "🇵🇰"],
        numberOfPairsOfCardsToShow: 6,
        color: .blue,
        accentColor: .red)
]


