//
//  ContentView.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/11/23.
//

import SwiftUI

struct HomeView: View {
    @State var datee = ""
    @State var showHowToPlay = false
    @State var showPuzzles = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    Spacer()
                    Image("wor")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.accentColor)
                    Text("Wordle")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 10)
                    Text("Get 6 chances to guess a 5-letter word.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        Button {
                            showPuzzles = true
                        } label: {
                            Text("Play")
                                .padding(.vertical, 20)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.plain)
                        .frame(width: 150, height: 60)
                        .background(.black)
                        .cornerRadius(70)
                        
                        Button {
                            showHowToPlay = true
                        } label: {
                            Text("How to play")
                                .padding(.vertical, 20)
                                .font(.title3)
                                .bold()
                        }
                        .buttonStyle(.plain)
                        .frame(width: 150, height: 60)
                        .background(.clear)
                        .cornerRadius(40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.black, lineWidth: 3)
                        }
                        .sheet(isPresented: $showHowToPlay) {
                            HowToView()
                        }
                    }
                    
                    .padding(.vertical, 20)
                    Text(datee)
                        .onAppear(perform: getDate)
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 5)
                    Text("UI Inspired by NYT's Wordle Game")
                        .bold()
                    Text("By James Lynch")
                        .bold()
                    Spacer()
                    
                }
                .padding()
                if showPuzzles {
                    PlayView(showPuzzles: $showPuzzles)
                }
            }
            
        }
    }
    
    func getDate() {
        let date = Date()
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.long
        df.timeStyle = DateFormatter.Style.none
        
        self.datee = df.string(from: date)
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
