//
//  Key.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation
import SwiftUI

class Key {
    var letter: String
    var state: String //Correct, WrongSpot, Invalid, Neutral
    var backgroundColor: Color

    init(letter: String, state: String, color: Color) {
        self.letter = letter
        self.state = state
        self.backgroundColor = color
    }
    
    var exit: Bool {
        if letter == "EXIT" {
            return true;
        } else {
            return false;
        }
    }
    
    var ent: Bool {
        if letter == "ENTER" {
            return true;
        } else {
            return false;
        }
    }
    
    var fontColor: Color {
        switch(state) {
            case "Neutral":
                return Color.black;

            default:
                return Color.white;
        }
    }
    
    var disabled: Bool {
        switch(state) {
            case "Invalid":
                return true;
            
            default:
                return false;
        }
    }
    
    func setState(state: String) {
        self.state = state
        setBackgroundColor(state: state)
    }
    
    func setLetter(letter: String) {
        self.letter = letter
    }
    
    func setBackgroundColor(state: String) {
        switch(state) {
            case "Correct":
                self.backgroundColor = Color("Correct")
            
            case "WrongSpot":
                self.backgroundColor = Color("WrongSpot")

            case "Invalid":
                self.backgroundColor = Color("Invalid")
            
            case "Neutral":
                self.backgroundColor = Color("Neutral");

            default:
                self.backgroundColor = Color.black;
        }
    }
    
}

extension Key {
    static var example: Key {
        Key(letter: "EXIT", state: "Neutral", color: Color("Neutral"))
    }
}
