//
//  PipeView.swift
//  FlappyBird
//
//  Created by Olya B on 07.11.2023.
//

import SwiftUI

struct PipeView: View {
    let topPipeHeight: CGFloat
    let pipeWidth: CGFloat
    let pipeSpacing: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let availableHeight = geometry.size.height - pipeSpacing
            let bottomPipeHeight = availableHeight - topPipeHeight
            
            VStack {
                Image("FlappyBirdPipe")
                    .resizable()
                    .rotationEffect(.degrees(180))
                    .frame(width: pipeWidth, height: topPipeHeight)
                
                Spacer()
                    .frame(height: pipeSpacing)
                
                Image("FlappyBirdPipe")
                    .resizable()
                    .frame(width: pipeWidth, height: bottomPipeHeight)
                    .scaleEffect(x: -1, y: 1, anchor: .center)
            }
        }
    }
}

struct PipeView_Previews: PreviewProvider {
    static var previews: some View {
        PipeView(topPipeHeight: 300, pipeWidth: 100, pipeSpacing: 100)
    }
}
