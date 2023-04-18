//
//  KeyView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import SwiftUI

struct KeyView: View {
    @ObservedObject var viewModel: KeyVM
    
    var body: some View {
        ZStack {
            if viewModel.ent || viewModel.exit {
                Rectangle()
                    .frame(width: 55, height: 50)
                    .foregroundColor(viewModel.backgroundColor)
                    .cornerRadius(6)
                
                if viewModel.exit {
                    Image(systemName: "delete.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 20)
                } else {
                    Text(viewModel.letter)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(viewModel.fontColor)
                }
            } else {
                Rectangle()
                    .frame(width: 27, height: 50)
                    .foregroundColor(viewModel.backgroundColor)
                    .cornerRadius(6)
                
                Text(viewModel.letter)
                    .font(.headline)
                    .bold()
                    .foregroundColor(viewModel.fontColor)
            }
        }
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView(viewModel: KeyVM(model: Key.example))
    }
}

