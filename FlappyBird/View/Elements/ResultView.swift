//
//  ResultView.swift
//  FlappyBird
//
//  Created by Olya B on 07.11.2023.
//

import SwiftUI

struct ResultView: View {
    
    let score: Int
    let highScore: Int
    private let gameOverHeight: CGFloat = 60
    private let resetButtonHeight: CGFloat = 40
    
    let resetAction: () -> Void
    
    var body: some View {
        VStack {
            Image("GameOver")
                .resizable()
                .scaledToFit()
                .frame(height: gameOverHeight)
                .padding([.horizontal, .vertical])
            Text("Score: \(score)")
                .font(.title)
            Text("Best: \(highScore)")
                .font(.title2)
            Button(action: resetAction) {
                Image("resetButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: resetButtonHeight)
                    .padding(.bottom)
            }
        }
        .background(.white.opacity(0.8))
        .shadow(radius: 10)
        .cornerRadius(20)
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 5, highScore: 8, resetAction: {})
    }
}
