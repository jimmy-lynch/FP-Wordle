//
//  Player.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation

class Player {
    var guessNumber: Int = 0 //0 - 5 (6 guesses)
    var currPosition: Int = 0
    var guessedLetters = [String]()
    var wordToGuess: [String] = ["P","L","A","C","E"]
    
    var keyboard: KeyboardVM {
        let temp = KeyboardVM()
        temp.load()
        return temp
    }
    
    var game: GameVM {
        let temp = GameVM()
        temp.setGameBoard()
        return temp
    }
    
    func incrementPosition() {
        currPosition += 1
    }
    
    func decrementPosition() {
        currPosition -= 1
    }
    
    func incrementGuess() {
        guessNumber += 1
    }
    
    func setWord(word: String) {
        let w = word.uppercased()
        let temp: [String] = w.map { String($0) }
        wordToGuess = temp
    }
    
    func resetPosition() {
        currPosition = 0
    }
    
    func addGuessedLetter(letter: String) {
        guessedLetters.append(letter);
    }
}
