//
//  GameRowVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import Foundation

class GameRowVM: ObservableObject, Identifiable {
    @Published var GameRow = [GameSquareVM]()
    @Published var id = UUID()
    
    func addGameSquare(viewModel: GameSquareVM) {
        GameRow.append(viewModel)
    }
    
    func setGameSquare(position: Int, model: GameSquareVM) {
        GameRow[position] = model
    }
    
    func pullLetters() -> [String] {
        var letters = [String]()
        letters.append(GameRow[0].letter)
        letters.append(GameRow[1].letter)
        letters.append(GameRow[2].letter)
        letters.append(GameRow[3].letter)
        letters.append(GameRow[4].letter)
        
        return letters
    }
}

extension GameRowVM {
    static var example : GameRowVM {
        let temp: GameSquareVM = GameSquareVM(model: GameSquare.example)
        let gameRow: GameRowVM = GameRowVM()
        gameRow.addGameSquare(viewModel: temp)
        gameRow.addGameSquare(viewModel: temp)
        gameRow.addGameSquare(viewModel: temp)
        gameRow.addGameSquare(viewModel: temp)
        gameRow.addGameSquare(viewModel: temp)

        return gameRow
    }
}
