//
//  BackgroundView.swift
//  FlappyBird
//
//  Created by Olya B on 20.11.2023.
//

import SwiftUI

struct BackgroundView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        Image(viewModel.gameModel.backgroundImage)
            .resizable()
            .ignoresSafeArea()
            .padding(EdgeInsets(top: 0,
                                leading: 0,
                                bottom: -50,
                                trailing: -20))
            .onAppear {
                updateBackground()
            }
            .onChange(of: colorScheme) { _ in
                updateBackground()
            }
    }
    
    func updateBackground() {
        viewModel.gameModel.backgroundImage = colorScheme == .light ? "FlappyBirdBackground" : "FlappyBirdBackground_night"
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
