//
//  LottieView.swift
//  Mindji
//
//  Created by Antonela Madalina on 07/10/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename: String

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
             
             let animationView = AnimationView()
             let animation = Animation.named(filename)
             animationView.animation = animation
             animationView.contentMode = .scaleAspectFill
             animationView.loopMode = .loop

             animationView.play()
             
             animationView.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(animationView)
             
             NSLayoutConstraint.activate([
                 animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                 animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
             ])
             
             return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}

