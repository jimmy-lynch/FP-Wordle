//
//  KeyboardView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import SwiftUI

struct KeyboardView: View {
    @ObservedObject var playerModel: PlayerVM
    @ObservedObject var keyModel: KeyboardVM

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                ForEach(keyModel.row_one) {
                    key in
                    Button {
                        playerModel.addLetter(letter: key.letter)
                    } label: {
                        KeyView(viewModel: key)
                    }
                    .modifier(MyButtonModifier(backgroundColor: Color.clear))
                    .disabled(key.disabled || playerModel.correct)
                }
            }
            
            HStack(alignment: .center) {
                ForEach(keyModel.row_two) {
                    key in
                    Button {
                        playerModel.addLetter(letter: key.letter)
                    } label: {
                        KeyView(viewModel: key)
                    }
                    .modifier(MyButtonModifier(backgroundColor: Color.clear))
                    .disabled(key.disabled || playerModel.correct)
                }
            }
            
            HStack(alignment: .center) {
                ForEach(keyModel.row_three) {
                    key in
                    Button {
                        playerModel.addLetter(letter: key.letter)
                    } label: {
                        KeyView(viewModel: key)
                    }
                    .modifier(MyButtonModifier(backgroundColor: Color.clear))
                    .disabled(key.disabled || playerModel.correct)
                }
                
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(playerModel: PlayerVM(model: Player()), keyModel: KeyboardVM.example)
    }
}

