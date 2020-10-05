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
                            withAnimation(.linear(duration: 0.75)) {
                                    self.pairViewModel.chooseCard(card: card)
                                }
                        }
                        .padding(5)
                    }
                    .padding()
                    .navigationBarTitle(pairViewModel.theme.name)
                    .navigationBarItems(
                        leading: Button("Reset") {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.pairViewModel.reset()
                            }
                        },
                        trailing: Button("New theme") {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.pairViewModel.newGame()
                            }
                        }
                    )
                    .foregroundColor(pairViewModel.theme.color)
                } else {
                    Group {
                        Text("Game Over!!")
                        Text("Score: \(pairViewModel.score) ")
                    }
                    .transition(.identity)
                    .animation(Animation.easeOut(duration: 1))
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
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        
                    }
                }
                .padding(5).opacity(0.3)
                .transition(.scale)

                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp, gradient: gradient)
            .transition(.identity)
        }
    }
    
    //MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = PairViewModel()
        game.chooseCard(card: game.cards[1])
        return PairView(pairViewModel: PairViewModel())
    }
}
