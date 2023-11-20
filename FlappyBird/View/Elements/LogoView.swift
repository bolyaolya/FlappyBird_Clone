//
//  LogoView.swift
//  FlappyBird
//
//  Created by Olya B on 20.11.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        Image("FlappyBird")
            .resizable()
            .scaledToFit()
            .frame(width: 270)
            .padding(.top, -150)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
