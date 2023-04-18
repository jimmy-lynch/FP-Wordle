//
//  PuzzleView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import SwiftUI

struct PuzzleView: View {
    var puzzle: Int
    @ObservedObject var model = PlayerVM(model: Player())
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Text("Puzzle #\(puzzle)")
                    Spacer()
                    GameView(model: model.Game)
                    Spacer()
                    KeyboardView(playerModel: model, keyModel: model.Keyboard)
                    Spacer()
                }
                
                if model.correct {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.white)
                        .opacity(0.8)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(Color("Correct"))
                        .frame(width: 320, height: 220)
                    VStack {
                        Text("WOOHOO!!")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 5)
                        
                        if model.guessNumber <= 1 {
                            Text("You got the word in \(model.guessNumber) attempt.")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 5)

                        } else {
                            Text("You got the word in \(model.guessNumber) attempts.")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 5)

                        }
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("BACK")
                        }
                    }
                }
            }
        }
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(puzzle: 1)
    }
}
