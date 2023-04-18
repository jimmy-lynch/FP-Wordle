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
                        .font(.title)
                        .bold()
                        .padding(.vertical, -15)
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
                        .frame(width: 340, height: 220)
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
                            ZStack {
                                Rectangle()                            .foregroundColor(.white)
                                    .frame(width: 90, height: 45)
                                    .cornerRadius(20)
                                Text("BACK")
                                    .foregroundColor(Color("Correct"))
                                    .font(.title2)
                                    .bold()

                            }
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .padding(.top, 10)
                                .padding(.leading, 10)
                                .font(.title2)
                                .bold()
                            Text("Wordle")
                                .padding(.leading, 5)
                                .padding(.top, 10)
                                .bold()
                                .font(.largeTitle)
                        }
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 7) {
                        NavigationLink {
                            HowToView()
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .font(.title2)
                                .bold()
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink {
                            StatsView()
                        } label: {
                            Image(systemName: "chart.bar.fill")
                                .font(.title2)
                                .bold()
                        }
                        .buttonStyle(.plain)
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .font(.title2)
                                .bold()
                        }
                        .buttonStyle(.plain)
                        
                        
                    }
                    .padding(.top, 10)
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
