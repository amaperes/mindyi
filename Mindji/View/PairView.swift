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
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .padding(15)
                    .background(LinearGradient(gradient: Gradient(colors: [pairViewModel.theme.color, pairViewModel.theme.accentColor]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(5)
                    .border(pairViewModel.theme.color, width: 2)
                    .cornerRadius(20)
                    Grid(pairViewModel.cards) { card in
                        CardView(card: card, gradient: Gradient(colors: [self.pairViewModel.theme.color, self.pairViewModel.theme.accentColor])).onTapGesture {
                            withAnimation(.linear(duration: 0.75)) {
                                    self.pairViewModel.chooseCard(card: card)
                                }
                        }
                        .padding(3)
                    }
                    .padding()
                    .navigationBarTitle(pairViewModel.theme.name)
                    .foregroundColor(pairViewModel.theme.color)
                    
                } else {
                        GeometryReader { geometry in
                            VStack {
                                LottieView(filename: "21369-confetti").offset().frame(width: geometry.size.width, height: geometry.size.height)
                            }
                            .overlay(
                                Group {
                                    Text("Done!!!")
                                    Text("Score: \(self.pairViewModel.score)")
                                }
                                .padding(20)
                                .foregroundColor(self.pairViewModel.theme.color)
                                .background(Color.white).opacity(0.9)
                                .cornerRadius(20)
                                .font(.largeTitle)
                                ,alignment: .center)
                        }
                }
                HStack {
                    Button("Reset") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            self.pairViewModel.reset()
                        }
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [pairViewModel.theme.color, pairViewModel.theme.accentColor]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
                    Button("New theme") {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.pairViewModel.newGame()
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [pairViewModel.theme.color, pairViewModel.theme.accentColor]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 10)
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
                    .animation(card.isMatched ? Animation.spring().repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp, gradient: gradient)
            .transition(.scale)
        }
    }
    
    //MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}
