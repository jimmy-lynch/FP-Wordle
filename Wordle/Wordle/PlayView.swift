//
//  PlayView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import SwiftUI

struct PlayView: View {
    @Binding var showPuzzles: Bool

    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .foregroundColor(.white)
                        .opacity(0.8)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(Color("Correct"))
                        .frame(width: 370, height: 280)
                    VStack {
                        HStack {
                            Spacer()
                            ForEach((1...5), id: \.self) { index in
                                NavigationLink {
                                    PuzzleView(puzzle: index)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 40)
                                            .foregroundColor(.white)
                                            .frame(width: 55, height: 80)
                                        RoundedRectangle(cornerRadius: 40)
                                            .strokeBorder(.black, lineWidth: 4)
                                            .frame(width: 55, height: 80)
                                        Text("\(index)")
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .bold()
                                    }
                                }
                                .buttonStyle(.plain)
                                Spacer()
                            }
                        }
                    }
                }
                .toolbar {
                    Button {
                        showPuzzles = false
                    } label: {
                        Image(systemName: "plus")
                            .rotationEffect(.degrees(45))
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 20)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
                }
                Text("Select a Puzzle")
                    .frame(width: 370, height: 220, alignment: .top)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
        
            }
        }
    }
}

//struct PlayView_Previews: PreviewProvider {
  //  static var previews: some View {
    //}
//}
