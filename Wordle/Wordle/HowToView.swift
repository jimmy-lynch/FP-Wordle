//
//  HowToView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/12/23.
//

import SwiftUI

struct HowToView: View {
    var exampleViewModel: HowToVM = HowToVM()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Guess the Wordle in 6 tries.")
                        .font(.title2)
                        .padding(.bottom, 10)
                    Spacer()
                    VStack {
                        HStack {
                            Circle()
                                .frame(width: 8)
                            Text("Each guess must be a valid 5-letter word.")
                                .font(.callout)
                        }
                        HStack(alignment: .top) {
                            Circle()
                                .frame(width: 8)
                                .padding(.top, 5)
                            Text("The color of the tiles will change to show how close your guess was to the word")
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                    }
                    Text("Examples")
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 1)

                    VStack(alignment: .leading) {
                        VStack() {
                            GameRowView(model: exampleViewModel.example1)
                                .scaleEffect(0.7)
                                .frame(width: 230, height: 50, alignment: .trailing)
                                .fixedSize(horizontal: true, vertical: true)

                            Text("**W** is in the word and in the **correct** spot.")
                                .font(.callout)
                        }
                        .padding(.top, 20)

                        VStack(alignment: .leading) {
                            GameRowView(model: exampleViewModel.example2)
                                .frame(width: 10, height: 50, alignment: .leading)
                                .scaleEffect(0.7)
                                .fixedSize(horizontal: true, vertical: true)
                            
                            Text("**I** is in the word but in the **wrong** spot.")
                                .font(.callout)
                        }
                        .padding(.top, 20)

                        VStack(alignment: .leading) {
                            GameRowView(model: exampleViewModel.example3)
                                .frame(width: 10, height: 50, alignment: .leading)
                                .scaleEffect(0.7)
                                .fixedSize(horizontal: true, vertical: true)
                            
                            Text("**U** is not in the word in **any spot.**")
                                .font(.callout)
                        }
                        .padding(.top, 20)
                    }
                    Spacer()
                }
                .padding(.trailing, 30)
            }
            .navigationBarItems(leading: Text("How To Play")
                .padding(.leading, 24)
                .padding(.top, 100)
                .bold()
                .font(.largeTitle)
            )
            .padding(.top, 60)
            .padding(.leading, 30)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "plus")
                        .rotationEffect(.degrees(45))
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 20)
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            Spacer()
            Divider()
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
            
            VStack(alignment: .leading) {
                Text("A new puzzle is released daily at midnight. If you haven't already, you can sign up for our daily reminder email.")
                    .font(.footnote)

            }
            .padding()
            .padding(.horizontal, 20)
            .padding(.trailing, 30)
            Spacer()
        }
        .padding(.bottom, 50)
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
