//
//  PuzzleView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import SwiftUI


struct PuzzleView: View {
    @State var puzzle: Int
    @ObservedObject var model = PlayerVM(model: Player())
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    if model.failure {
                        Text("Try Again Later!")
                            .font(.title)
                            .bold()
                            .foregroundColor(.red)
                            .padding(.vertical, -15)
                    } else if model.correct {
                            Text("YAY!")
                                .font(.title)
                                .bold()
                                .padding(.vertical, -15)
                                .foregroundColor(Color("Correct"))
                    } else {
                        Text("Puzzle #\(puzzle)")
                            .font(.title)
                            .bold()
                            .padding(.vertical, -15)
                    }
                    Spacer()
                    GameView(model: model.Game)
                    Spacer()
                    KeyboardView(playerModel: model, keyModel: model.Keyboard)
                    Spacer()
                }
                if model.correct {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.green)
                        .opacity(0.05)
                }
                if model.failure {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.red)
                        .opacity(0.05)
                }
                
                if model.spell {
                    ZStack {
                        Rectangle()
                            .edgesIgnoringSafeArea(.all)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("Invalid"))
                            .frame(width: 340, height: 220)
                            .shadow(color: .black, radius: 5)
                        
                        Text("The word must be real.")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
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
            .animation(.easeOut, value: 20)
            .onAppear {
                model.setPuzzle(puzzle: puzzle)
            }
        }
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView(puzzle: 1)
    }
}
