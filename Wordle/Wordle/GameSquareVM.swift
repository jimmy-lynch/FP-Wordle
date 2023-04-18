//
//  GameSquareVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import Foundation
import SwiftUI

struct GameSquareVM: Identifiable {
    let model: GameSquare
    var id: UUID {
        UUID()
    }
    var letter: String {
        model.letter.uppercased()
    }
    
    var blank: Bool {
        if model.state == "Blank" {
            return true;
        } else {
            return false;
        }
    }
    
    var color: Color {
        switch(model.state) {
            case "Correct":
                return Color("Correct")
            
            case "WrongSpot":
                return Color("WrongSpot")

            case "Invalid":
                return Color("Invalid")
            
            case "example":
                return Color.white;

            default:
                return Color.black;
            
        }
    }
}

