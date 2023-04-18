//
//  PuzzleView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import SwiftUI

struct PuzzleView: View {
    var puzzle: Int
    @ObservedObject var model = PlayerVM(model: Player())
    
    var body: some View {
        VStack {
            Spacer()
            Text("Puzzle #\(puzzle)")
            Spacer()
            GameView(model: model.Game)
            Spacer()
            KeyboardView(playerModel: model, keyModel: model.Keyboard)
        }
       
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(puzzle: 1)
    }
}
