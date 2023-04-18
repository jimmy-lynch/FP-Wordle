//
//  GameView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import SwiftUI

struct GameView: View {
    var model: GameVM
    
    var body: some View {
        VStack {
            ForEach(model.gameboard) {
                gamerow in
                GameRowView(model: gamerow)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(model: GameVM.example)
    }
}
