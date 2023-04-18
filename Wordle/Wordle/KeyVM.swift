//
//  KeyVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/16/23.
//

import Foundation
import SwiftUI

class KeyVM: Identifiable, ObservableObject {
    @Published var model: Key
    @Published var backgroundColor: Color
    let id = UUID()
    var letter: String { model.letter }
    var state: String { model.state }
    var exit: Bool { model.exit }
    var ent: Bool { model.ent }
    var fontColor: Color { model.fontColor }
    var disabled: Bool { model.disabled }
    
    init(model: Key) {
        self.model = model
        self.backgroundColor = model.backgroundColor
    }
    
    func setState(state: String) {
        model.setState(state: state)
        setBackgroundColor()
    }
    
    func setLetter(letter: String) {
        model.setLetter(letter: letter)
    }
    
    func setBackgroundColor() {
        backgroundColor = model.backgroundColor
    }
}

