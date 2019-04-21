//
//  ViewController.swift
//  BullsEye
//
//  Created by Hai Vu on 4/17/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	private var gameModel: GameModel!
	
	private weak var mainView: MainView! {
		guard isViewLoaded else {
			return nil
		}
		return (view as! MainView)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		gameModel = GameModel()
		customLookAndFeelForSlider()
		startNewGame()
	}
	
	@IBAction func showAlert() {
		let different = calcDiff(num1: gameModel.targetValue, num2: gameModel.currentValue)
		var point = 100 - different
		let title: String!
		if different == 0 {
			title = "Perfect!"
			point += 100
		} else if different < 5 {
			title = "you almost had it!"
		} else if different < 10 {
			title = "Pretty good!"
		} else {
			title = "Not ever close..."
		}
		gameModel.totalScore += point
		let message = "your point is: \(point)"
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let alertAction = UIAlertAction(title: "OK", style: .default) {
			_ in
			self.startNewRound()
		}
		alert.addAction(alertAction)
		present(alert, animated: true)
	}
	@IBAction func sliderMove(_ slider: UISlider) {
		gameModel.currentValue = lroundf(slider.value)
	}
	@IBAction func startNewGame() {
		gameModel.totalScore = 0
		gameModel.round = 0
		startNewRound()
		let transition = CATransition()
		transition.type = .fade
		transition.duration = 1
		transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
		view.layer.add(transition, forKey: nil)
	}
	func startNewRound() {
		gameModel.targetValue = Int.random(in: 1...100)
		gameModel.currentValue = 50
		mainView.slider.value = Float(gameModel.currentValue)
		gameModel.round += 1
		updateLabels()
	}
	func updateLabels() {
		mainView.targetLabel.text = String(gameModel.targetValue)
		mainView.totalScoreLabel.text = String(gameModel.totalScore)
		mainView.roundLabel.text = String(gameModel.round)
	}
	func customLookAndFeelForSlider() {
		let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
		mainView.slider.setThumbImage(thumbImageNormal, for: .normal)
		let thumbImageHighlight = UIImage(named: "SliderThumb-Highlighted")
		mainView.slider.setThumbImage(thumbImageHighlight, for: .highlighted)
		let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
		let trackLeftImage = UIImage(named: "SliderTrackLeft")
		let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
		mainView.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
		let trackRightImage = UIImage(named: "SliderTrackRight")
		let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
		mainView.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
	}
}

