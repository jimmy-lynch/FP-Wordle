//
//  HowToVM.swift
//  Wordle
//
//  Created by Jimmy Lynch on 4/13/23.
//

import Foundation

struct HowToVM {
    let examples: [GameSquare] = Bundle.main.decode("examples.json")
    
    var example1: GameRowVM {
        var temp: GameRowVM = GameRowVM()
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[0]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[1]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[2]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[3]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[4]))
        return temp
    }
    
    var example2: GameRowVM {
        var temp: GameRowVM = GameRowVM()
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[5]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[6]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[7]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[8]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[9]))
        return temp
    }
    
    var example3: GameRowVM {
        var temp: GameRowVM = GameRowVM()
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[10]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[11]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[12]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[13]))
        temp.addGameSquare(viewModel: GameSquareVM(model: examples[14]))
        return temp
    }

}
