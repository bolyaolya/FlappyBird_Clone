//
//  GameController.swift
//  FlappyBird
//
//  Created by Olya B on 17.11.2023.
//

import SwiftUI

//class GameController: ObservableObject {
//    
//    @ObservedObject var model = GameModel()
//    
//    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
//    
//    init() {
//        model.gameState = .ready
//    }
//    
//    func playButtonAction() {
//        print("playButtonAction called")
//        model.gameState = .active
//        model.lastUpdateTime = Date()
//    }
//    
//    func onGameTap() {
//        print("onGameTap called")
//        model.birdVelocity = CGVector(dx: 0, dy: model.jumpVelocity)
//    }
//    
//    func onTimerUpdate(currentTime: Date, geometry: GeometryProxy) {
//        guard model.gameState == .active else { return }
//        let deltaTime = currentTime.timeIntervalSince(model.lastUpdateTime)
//        
//        model.applyGravity(deltaTime: deltaTime)
//        model.updateBirdPosition(deltaTime: deltaTime)
//        model.checkBoundaries(geometry: geometry)
//        model.updatePipePosition(deltaTime: deltaTime)
//        model.resetPipePositionIfNeeded(geometry: geometry)
//        
//        if model.checkCollisions(geometry: geometry) {
//            model.gameState = .stopped
//        }
//        model.updateScores(geometry: geometry)
//        
//        model.lastUpdateTime = currentTime
//    }
//    
//    var gameState: GameState {
//            return model.gameState
//        }
//}
//
