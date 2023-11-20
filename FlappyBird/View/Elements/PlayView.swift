//
//  PlayView.swift
//  FlappyBird
//
//  Created by Olya B on 20.11.2023.
//

import SwiftUI

struct PlayView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Image("FlappyBird")
            .resizable()
            .scaledToFit()
            .frame(width: 270)
            .padding(.top, -150)
        
        Button(action: viewModel.playButtonAction) {
            Image(systemName: "play.fill")
        }
        .font(.system(size: 60))
        .foregroundColor(.white)
        .padding(.bottom, 60)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(viewModel: GameViewModel())
    }
}
