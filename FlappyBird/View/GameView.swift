//
//  GameView.swift
//  FlappyBird
//
//  Created by Olya B on 07.11.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    BackgroundView()
                    
                    BirdView(birdSize: viewModel.gameModel.birdSize)
                        .position(viewModel.gameModel.birdPosition)
                    
                    PipeView(topPipeHeight: viewModel.gameModel.topPipeHeight,
                             pipeWidth: viewModel.gameModel.pipeWidth,
                             pipeSpacing: viewModel.gameModel.pipeSpacing)
                    .offset(x: geometry.size.width + viewModel.gameModel.pipeOffset)
                    
                    if viewModel.gameModel.gameState == .ready {
                        
                        VStack() {
                            PlayView(viewModel: viewModel)
                        }
                    }
                    if viewModel.gameModel.gameState == .stopped {
                        ResultView(score: viewModel.gameModel.score, highScore: viewModel.gameModel.highScore) {
                            viewModel.resetGame()
                        }
                    }
                }
                .onTapGesture {
                    viewModel.onGameTap()
                }
                .onReceive(viewModel.gameModel.timer) { currentTime in
                    viewModel.onTimerUpdate(currentTime: currentTime, geometry: geometry)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text(viewModel.gameModel.score.formatted())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
