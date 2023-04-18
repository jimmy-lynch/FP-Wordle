//
//  GameRowView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import SwiftUI

struct GameRowView: View {
    @ObservedObject var model: GameRowVM
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                ForEach(model.GameRow) {
                    gamesq in
                    GameSquareView(viewModel: gamesq)
                }
            }
        }
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(model: GameRowVM.example)
    }
}
