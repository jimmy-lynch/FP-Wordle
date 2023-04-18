//
//  GameSquare.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import Foundation

struct GameSquare: Identifiable, Codable {
    var id: String
    var letter: String
    var state: String //Correct, WrongSpot, Invalid, Blank
}

extension GameSquare {
    static var example : GameSquare {
        GameSquare(id: "1", letter: "l", state: "example")
    }
}
