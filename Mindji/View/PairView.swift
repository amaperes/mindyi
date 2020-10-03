//
//  PairView.swift
//  Mindji
//
//  Created by Antonela Madalina on 29/09/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct PairView: View {
    @ObservedObject var pairViewModel: PairViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if !pairViewModel.gameOver {
                    Text("Score: \(pairViewModel.score) ")
                    Grid(pairViewModel.cards) { card in
                        CardView(card: card, gradient: Gradient(colors: [self.pairViewModel.theme.color, self.pairViewModel.theme.accentColor])).onTapGesture {
                            self.pairViewModel.chooseCard(card: card)
                        }
                        .padding(5)
                    }
                    .padding()
                    .navigationBarTitle(pairViewModel.theme.name)
                    .navigationBarItems(trailing: Button("New Game"){
                        self.pairViewModel.newGame()
                    }).foregroundColor(pairViewModel.theme.color)
                    
              
                } else {
                    Text("Game Over!!")
                    Text("Score: \(pairViewModel.score) ")
                }
            }
        }
    }
}

struct CardView: View {
    var card: PairModel<String>.Card
    let gradient: Gradient

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Circle()
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
       // .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    
    //MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 2.5
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.5
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PairView(pairViewModel: PairViewModel())
    }
}
