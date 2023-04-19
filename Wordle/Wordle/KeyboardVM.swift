//
//  KeyboardVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation
import SwiftUI

class KeyboardVM: ObservableObject {
    @Published var row_one = [KeyVM]()
    @Published var row_two = [KeyVM]()
    @Published var row_three = [KeyVM]()
    
    let r1 = ["Q","W","E","R","T","Y","U","I","O","P"]
    let r2 = ["A","S","D","F","G","H","J","K","L"]
    let r3 = ["ENTER","Z","X","C","V","B","N","M","EXIT"]
    
    let r1index = ["Q": 0, "W": 1, "E": 2, "R": 3, "T": 4, "Y": 5, "U": 6, "I": 7, "O": 8, "P": 9]
    let r2index = ["A": 0, "S": 1, "D": 2, "F": 3, "G": 4, "H": 5, "J": 6, "K": 7, "L": 8]
    let r3index = ["ENTER": 0, "Z": 1, "X": 2, "C": 3, "V": 4, "B": 5, "N": 6, "M": 7, "EXIT": 8]

    func load() {
        for letter in r1 {
            row_one.append(KeyVM(model: Key(letter: letter, state: "Neutral", color: Color("Neutral"))))
        }
        
        for letter in r2 {
            row_two.append(KeyVM(model: Key(letter: letter, state: "Neutral", color: Color("Neutral"))))
        }
        
        for letter in r3 {
            row_three.append(KeyVM(model: Key(letter: letter, state: "Neutral", color: Color("Neutral"))))
        }
    }
    
    func updateKeys(letters: [String], states: [String]) {
        for n in 0...4 {
            let l = letters[n]
            let s = states[n]
            
            if r1.contains(l) {
                guard let position = r1index[l] else { return }
                row_one[position].setState(state: s)
                self.objectWillChange.send()
            } else if r2.contains(l) {
                guard let position = r2index[l] else { return }
                row_two[position].setState(state: s)
                self.objectWillChange.send()
            } else { //r3
                guard let position = r3index[l] else { return }
                row_three[position].setState(state: s)
                self.objectWillChange.send()
            }
        }
    }
}

extension KeyboardVM {
    static var example : KeyboardVM {
        let temp: KeyboardVM = KeyboardVM()
        temp.load()
        
        return temp
    }
}
//Keyboard idea:
