//
//  GameModel.swift
//  FlappyBird
//
//  Created by Olya B on 17.11.2023.
//

import Foundation
import SwiftUI
import Combine

enum GameState {
    case ready, active, stopped
}

struct GameModel {
    @AppStorage("highScore") var highScore: Int = 0
    var birdVelocity: CGVector
    var birdPosition: CGPoint
    var gameState: GameState
    var lastUpdateTime: Date
    var score: Int
    var pipeOffset: CGFloat
    var topPipeHeight: CGFloat
    var passedPipe: Bool
    let birdSize: CGFloat
    var birdRadius: CGFloat
    var pipeWidth: CGFloat
    var pipeSpacing: CGFloat
    var jumpVelocity: Int
    var gravity: CGFloat
    var groundHeight: CGFloat
    var backgroundImage: String
    var timer: Publishers.Autoconnect<Timer.TimerPublisher>
}

