//
//  GameScreenViewModel.swift
//  UITestingSample
//
//

import Foundation

enum GameStyle: Int {
    case moveSlider
    case guessPosition
}

final class GameScreenViewModel {
    var round: Int = 0
    let startValue = Int.random(in: 0..<100)
    var targetValue = 50
    var scoreRound: Int = .zero
    var scoreTotal: Int = .zero

    init() {
        startNewGame()
    }

    func startNewGame() {
        round = 1
        scoreTotal = 0
    }

    func startNewRound(completion: @escaping () -> Void) {
        round += 1
        scoreRound = 0
        self.targetValue = Int.random(in: 0..<100)
        completion()
    }

    @discardableResult
    func check(guess: Int) -> Int {
        let difference = guess - targetValue
        scoreRound = 100 - difference
        scoreTotal += scoreRound
        return difference
    }
}
