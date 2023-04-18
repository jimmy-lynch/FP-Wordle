//
//  PlayerVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation

class PlayerVM: ObservableObject {
    @Published var model: Player
    @Published var Keyboard: KeyboardVM
    @Published var Game: GameVM
    
    var guessNumber: Int {
        model.guessNumber
    }
    var guessedLetters: [String] {
        model.guessedLetters
    }
    var currPosition: Int {
        model.currPosition
    }
    var wordToGuess: [String] { //Make sure programmed to be lowercase!
        model.wordToGuess
    }
    
    init(model: Player) {
        self.model = model
        Keyboard = model.keyboard
        Game = model.game
    }
    
    func addLetter(letter: String) {
        if (letter == "EXIT") {
            if (currPosition > 0) {
                decrementPosition()
                Game.removeLetter(row: guessNumber, position: currPosition)
            }
            
        } else if (letter == "ENTER") {
            if (currPosition == 5) { //ie its full
                Game.submit(row: guessNumber, word: wordToGuess)
                let letters: [String] = Game.getLetters(row: guessNumber)
                let states: [String] = Game.getStates(letters: letters, word: wordToGuess)
                incrementGuess()
                for letter in letters {
                    addGuessedLetter(letter: letter)
                }
                Keyboard.updateKeys(letters: letters, states: states)
                resetPosition()
                
            } else {
                //some visual to show its not filled
            }
                        
            //submit! if a full 5 (error if not), for now not checking for true words, but can do a API call to a dictionary for that later on if I want to add it!
            
        } else {
            if (currPosition < 5) { //Add Letter
                Game.addLetter(row: guessNumber, position: currPosition, letter: letter)
                incrementPosition()
            }
            //else, do nothing!
        }
        objectWillChange.send()
    }
    
    func setWord(word: String) { //backend function, no error handling bc only being used for the puzzle views to set words, not encrypted bc proof of concept
        model.setWord(word: word)
    }
    
    func incrementPosition() {
        model.incrementPosition()
    }
    
    func decrementPosition() {
        model.decrementPosition()
    }
    
    func resetPosition() {
        model.resetPosition()
    }
    
    func incrementGuess() {
        model.incrementGuess()
    }
    
    func addGuessedLetter(letter: String) {
        model.addGuessedLetter(letter: letter)
    }
}
