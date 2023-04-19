//
//  PlayerVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation
import UIKit
import SwiftUI

class PlayerVM: ObservableObject {
    @Published var model: Player
    @Published var Keyboard: KeyboardVM
    @Published var Game: GameVM
    @Published var spell: Bool = false
    var correct: Bool = false
    var failure: Bool = false
    var spellcheck: Bool = false
    
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
                let guess: String = Game.getWord(row: guessNumber)
                let spellcheck: Bool = self.realWord(word: guess)
                if (!spellcheck) {
                    self.spell = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.spell = false
                    }
                    return;
                }
                Game.submit(row: guessNumber, word: wordToGuess)
                let letters: [String] = Game.getLetters(row: guessNumber)
                let states: [String] = Game.getStates(letters: letters, word: wordToGuess)
                Keyboard.updateKeys(letters: letters, states: states)
                let correct: Bool = correct(states: states)
                incrementGuess()
                if (guessNumber == 6) {
                    self.failure = true
                    objectWillChange.send()
                }
                if (correct) {
                    self.correct = true;
                    objectWillChange.send();
                } else {
                    for letter in letters {
                        addGuessedLetter(letter: letter)
                    }
                    resetPosition()
                }
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
    
    func setPuzzle(puzzle: Int) {
        switch (puzzle) {
        case 1:
            setWord(word: "money")
        case 2:
            setWord(word: "field")
        case 3:
            setWord(word: "utter")
        case 4:
            setWord(word: "yearn")
        case 5:
            setWord(word: "lungs")

        default:
            setWord(word: "place")
        }
    }
    
    func addGuessedLetter(letter: String) {
        model.addGuessedLetter(letter: letter)
    }
    
    func correct(states: [String]) -> Bool {
        for n in 0..<states.count {
            if states[n] == "Correct" {
                continue
            } else {
                return false;
            }
        }
        
        return true;
    }
    
    func realWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

}
