//
//  GameViewModel.swift
//  FlappyBird
//
//  Created by Olya B on 17.11.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var gameModel: GameModel
    
    init() {
        self.gameModel = GameModel(
            birdVelocity: CGVector(dx: 0, dy: 0),
            birdPosition: CGPoint(x: 100, y: 350),
            gameState: .ready,
            lastUpdateTime: Date(),
            score: 0,
            pipeOffset: 0,
            topPipeHeight: CGFloat.random(in: 100...500),
            passedPipe: false,
            birdSize: 80,
            birdRadius: 13,
            pipeWidth: 100,
            pipeSpacing: 150,
            jumpVelocity: -400,
            gravity: 1000,
            groundHeight: 100,
            backgroundImage: "FlappyBirdBackground",
            timer: Timer.publish(every: 0.01, on: .main, in: .common).autoconnect())
    }
    
    func playButtonAction() {
        if gameModel.gameState == .ready {
            gameModel.gameState = .active
            gameModel.lastUpdateTime = Date()
        }
    }
    
    func onGameTap() {
        gameModel.birdVelocity = CGVector(dx: 0, dy: gameModel.jumpVelocity)
    }
    
    func onTimerUpdate(currentTime: Date, geometry: GeometryProxy) {
        guard gameModel.gameState == .active else { return }
        let deltaTime = currentTime.timeIntervalSince(gameModel.lastUpdateTime)
        
        applyGravity(deltaTime: deltaTime)
        updateBirdPosition(deltaTime: deltaTime)
        checkBoundaries(geometry: geometry)
        updatePipePosition(deltaTime: deltaTime)
        resetPipePositionIfNeeded(geometry: geometry)
        
        if checkCollisions(geometry: geometry) {
            gameModel.gameState = .stopped
        }
        updateScores(geometry: geometry)
        
        gameModel.lastUpdateTime = currentTime
    }
    
    func applyGravity(deltaTime: TimeInterval) {
        gameModel.birdVelocity.dy += CGFloat(gameModel.gravity * deltaTime)
    }
    
    func updateBirdPosition(deltaTime: TimeInterval) {
        gameModel.birdPosition.y += gameModel.birdVelocity.dy * CGFloat(deltaTime)
    }
    
    func checkBoundaries(geometry: GeometryProxy) {
        if gameModel.birdPosition.y <= 0 {
            gameModel.birdPosition.y = 0
            gameModel.gameState = .stopped
        }
        if gameModel.birdPosition.y > geometry.size.height - gameModel.groundHeight {
            gameModel.birdPosition.y = geometry.size.height - gameModel.groundHeight
            gameModel.birdVelocity.dy = 0
            gameModel.gameState = .stopped
        }
    }
    
    func checkCollisions(geometry: GeometryProxy) -> Bool {
        let birdFrame = CGRect(x: gameModel.birdPosition.x - gameModel.birdRadius / 2,
                               y: gameModel.birdPosition.y - gameModel.birdRadius / 2,
                               width: gameModel.birdRadius,
                               height: gameModel.birdRadius)
        let topPipeFrame = CGRect(x: geometry.size.width + gameModel.pipeOffset,
                                  y: 0,
                                  width: gameModel.pipeWidth,
                                  height: gameModel.topPipeHeight)
        let bottomPipeFrame = CGRect(x: geometry.size.width + gameModel.pipeOffset,
                                     y: gameModel.topPipeHeight + gameModel.pipeSpacing,
                                     width: gameModel.pipeWidth,
                                     height: gameModel.topPipeHeight)
        
        return birdFrame.intersects(topPipeFrame) || birdFrame.intersects(bottomPipeFrame)
    }
    
    func updatePipePosition(deltaTime: TimeInterval) {
        gameModel.pipeOffset -= CGFloat(300 * deltaTime)
    }
    
    func resetPipePositionIfNeeded(geometry: GeometryProxy) {
        if gameModel.pipeOffset <= -geometry.size.width - gameModel.pipeWidth {
            gameModel.pipeOffset = 0
            gameModel.topPipeHeight = CGFloat.random(in: 100...500)
        }
    }
    
    func updateScores(geometry: GeometryProxy) {
        if (gameModel.pipeOffset + gameModel.pipeWidth + geometry.size.width) < gameModel.birdPosition.x && !gameModel.passedPipe {
            gameModel.score += 1
            
            if gameModel.score > gameModel.highScore {
                gameModel.highScore = gameModel.score
            }
            gameModel.passedPipe = true
        } else if gameModel.pipeOffset + geometry.size.width > gameModel.birdPosition.x {
            gameModel.passedPipe = false
        }
    }
    
    func resetGame() {
        gameModel.birdPosition = CGPoint(x: 100, y: 300)
        gameModel.birdVelocity = CGVector(dx: 0, dy: 0)
        gameModel.pipeOffset = 0
        gameModel.topPipeHeight = CGFloat.random(in: 100...500)
        gameModel.score = 0
        gameModel.gameState = .ready
    }
}
