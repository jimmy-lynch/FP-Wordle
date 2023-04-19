//
//  GameVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation

class GameVM: ObservableObject {
    @Published var gameboard = [GameRowVM]()
    
    func addLetter(row: Int, position: Int, letter: String) {
        let temp = GameSquareVM(model: GameSquare(id: "0", letter: letter, state: "example"))
        gameboard[row].setGameSquare(position: position, model: temp)
    }
    
    func removeLetter(row: Int, position: Int) {
        let empty = GameSquareVM(model: (GameSquare(id: "0", letter: "", state: "Blank")))
        gameboard[row].setGameSquare(position: position, model: empty)
    }
    
    func submit(row: Int, word: [String]) {
        let letters: [String] = gameboard[row].pullLetters()
        let states: [String] = getStates(letters: letters, word: word)
        
        for n in 0...4 {
            let temp = GameSquareVM(model: (GameSquare(id: "0", letter: letters[n], state: states[n])))
            gameboard[row].setGameSquare(position: n, model: temp)
        }
    }
    
    func getLetters(row: Int) -> [String] {
        let letters: [String] = gameboard[row].pullLetters()
        return letters
    }
    
    func getWord(row: Int) -> String {
        var word: String = ""
        let letters = getLetters(row: row)
        for l in letters {
            word += l
        }
        word = word.lowercased()
        return word
    }
    
    func getStates(letters: [String], word: [String]) -> [String] {
        //return String of States!
        var output = [String]()
        for n in 0...4 {
            let guessLetter = letters[n]
            let actualLetter = word[n]
            if word.contains(guessLetter) {
                if (guessLetter == actualLetter) {
                    output.append("Correct")
                    continue
                } else {
                    output.append("WrongSpot")
                    continue
                }
            } else {
                output.append("Invalid")
            }
        }
        
        return output
    }
    
    func setGameBoard() {
        let empty = GameSquareVM(model: (GameSquare(id: "0", letter: "", state: "Blank")))
        let row0 = GameRowVM()
        let row1 = GameRowVM()
        let row2 = GameRowVM()
        let row3 = GameRowVM()
        let row4 = GameRowVM()
        let row5 = GameRowVM()

        row0.addGameSquare(viewModel: empty)
        row0.addGameSquare(viewModel: empty)
        row0.addGameSquare(viewModel: empty)
        row0.addGameSquare(viewModel: empty)
        row0.addGameSquare(viewModel: empty)

        row1.addGameSquare(viewModel: empty)
        row1.addGameSquare(viewModel: empty)
        row1.addGameSquare(viewModel: empty)
        row1.addGameSquare(viewModel: empty)
        row1.addGameSquare(viewModel: empty)

        row2.addGameSquare(viewModel: empty)
        row2.addGameSquare(viewModel: empty)
        row2.addGameSquare(viewModel: empty)
        row2.addGameSquare(viewModel: empty)
        row2.addGameSquare(viewModel: empty)

        row3.addGameSquare(viewModel: empty)
        row3.addGameSquare(viewModel: empty)
        row3.addGameSquare(viewModel: empty)
        row3.addGameSquare(viewModel: empty)
        row3.addGameSquare(viewModel: empty)

        row4.addGameSquare(viewModel: empty)
        row4.addGameSquare(viewModel: empty)
        row4.addGameSquare(viewModel: empty)
        row4.addGameSquare(viewModel: empty)
        row4.addGameSquare(viewModel: empty)

        row5.addGameSquare(viewModel: empty)
        row5.addGameSquare(viewModel: empty)
        row5.addGameSquare(viewModel: empty)
        row5.addGameSquare(viewModel: empty)
        row5.addGameSquare(viewModel: empty)

        gameboard.append(row0)
        gameboard.append(row1)
        gameboard.append(row2)
        gameboard.append(row3)
        gameboard.append(row4)
        gameboard.append(row5)
    }
    
}

extension GameVM {
    static var example : GameVM {
        let temp: GameVM = GameVM()
        temp.setGameBoard()
        
        return temp
    }
}
