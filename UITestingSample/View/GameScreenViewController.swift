//
//  GameScreenViewController.swift
//  UITestingSample
//

import UIKit

final class GameScreenViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var targetGuessLabel: UILabel!
    @IBOutlet weak var targetGuessField: UITextField!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    // MARK: - IBAction
    @IBAction func chooseGameStyle(_ sender: UISegmentedControl) {
        if gameStyleRange.contains(sender.selectedSegmentIndex) {
            gameStyle = GameStyle(rawValue: sender.selectedSegmentIndex) ?? .moveSlider
            updateView()
        }
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "gameStyle")
    }

    @IBAction func checkGuess(_ sender: Any) {
        var guess: Int?
        switch gameStyle {
        case .moveSlider:
            guess = Int(lroundf(slider.value))
        case .guessPosition:
            targetGuessField.resignFirstResponder()
            guess = Int(targetGuessField.text ?? "")
        }
        if let guess = guess {
            showScoreAlert(difference: viewModel.check(guess: guess))
        } else {
            showNotAValidNumberAlert()
        }
    }

    @IBAction func startOver(_ sender: Any) {
        viewModel.startNewGame()
        updateView()
    }

    // MARK: - iVars
    let viewModel = GameScreenViewModel()
    let gameStyleRange = 0..<2
    var gameStyle: GameStyle = .guessPosition

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultGameStyle = UserDefaults.standard.integer(forKey: "gameStyle")
        if gameStyleRange.contains(defaultGameStyle) {
            gameStyle = GameStyle(rawValue: defaultGameStyle) ?? .moveSlider
            segmentedControl.selectedSegmentIndex = defaultGameStyle
        } else {
            gameStyle = .moveSlider
            UserDefaults.standard.set(0, forKey: "gameStyle")
        }
        updateView()
    }
}

// MARK: - Helper Methods
extension GameScreenViewController {
    func updateView() {
        switch gameStyle {
        case .moveSlider:
            targetGuessLabel.text = "Get as close as you can to: "
            targetGuessField.text = "\(viewModel.targetValue)"
            targetGuessField.isEnabled = false
            slider.value = Float(viewModel.startValue)
            slider.isEnabled = true
        case .guessPosition:
            targetGuessLabel.text = "Guess where the slider is: "
            targetGuessField.text = ""
            targetGuessField.placeholder = "1-100"
            targetGuessField.isEnabled = true
            slider.value = Float(viewModel.targetValue)
            slider.isEnabled = false
        }
        roundLabel.text = "Round: \(viewModel.round)"
        scoreLabel.text = "Score: \(viewModel.scoreTotal)"
    }

    func showScoreAlert(difference: Int) {
        let title = "You scored \(viewModel.scoreRound) points"
        let message = "The Number To be Guessed Was \(viewModel.targetValue)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.viewModel.startNewRound {
                alert.dismiss(animated: true, completion: nil)
                self.updateView()
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func showNotAValidNumberAlert() {
        let alert = UIAlertController(
            title: "Not A Number",
            message: "Please enter a positive number",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
