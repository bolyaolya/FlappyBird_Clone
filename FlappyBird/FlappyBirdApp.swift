//
//  FlappyBirdApp.swift
//  FlappyBird
//
//  Created by Olya B on 07.11.2023.
//

import SwiftUI

@main
struct FlappyBirdApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: GameViewModel())
        }
    }
}
