//
//  myButtonModifier.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/18/23.
//

import Foundation
import SwiftUI

struct MyButtonModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    let backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .background(backgroundColor.opacity(isEnabled ? 1 : 0.5))
    }
}
