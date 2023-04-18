//
//  GameSquareView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import SwiftUI

struct GameSquareView: View {
    let viewModel: GameSquareVM
    
    var body: some View {
        ZStack {
            if viewModel.blank {
                Rectangle()
                    .strokeBorder(Color("Neutral"), lineWidth: 2)
                    .frame(width:55, height: 55)
                    .foregroundColor(Color.white)
            } else {
                Rectangle()
                    .frame(width: 55, height: 55)
                    .foregroundColor(viewModel.color)
                
                 if (viewModel.model.state == "example") {
                    Rectangle()
                        .strokeBorder(.black, lineWidth: 3)
                        .frame(width:55, height: 55)
                    
                    Text(viewModel.letter)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(-9)
                } else {
                    Text(viewModel.letter)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(-9)

                }
            }
        }
    }
}

struct GameSquareView_Previews: PreviewProvider {
    static var previews: some View {
        GameSquareView(viewModel: GameSquareVM(model: GameSquare.example))
    }
}
