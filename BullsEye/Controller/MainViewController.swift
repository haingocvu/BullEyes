//
//  ViewController.swift
//  BullsEye
//
//  Created by Hai Vu on 4/17/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var totalScoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!
	var currentValue = 0
	var targetValue = 0
	var totalScore = 0
	var round = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		customLookAndFeelForSlider()
		startNewGame()
	}
	
	@IBAction func showAlert() {
		let different = calcDiff(num1: targetValue, num2: currentValue)
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
		totalScore += point
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
		currentValue = lroundf(slider.value)
	}
	@IBAction func startNewGame() {
		totalScore = 0
		round = 0
		startNewRound()
		let transition = CATransition()
		transition.type = .fade
		transition.duration = 1
		transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
		view.layer.add(transition, forKey: nil)
	}
	func startNewRound() {
		targetValue = Int.random(in: 1...100)
		currentValue = 50
		slider.value = Float(currentValue)
		round += 1
		updateLabels()
	}
	func updateLabels() {
		targetLabel.text = String(targetValue)
		totalScoreLabel.text = String(totalScore)
		roundLabel.text = String(round)
	}
	func customLookAndFeelForSlider() {
		let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
		slider.setThumbImage(thumbImageNormal, for: .normal)
		let thumbImageHighlight = UIImage(named: "SliderThumb-Highlighted")
		slider.setThumbImage(thumbImageHighlight, for: .highlighted)
		let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
		let trackLeftImage = UIImage(named: "SliderTrackLeft")
		let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
		slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
		let trackRightImage = UIImage(named: "SliderTrackRight")
		let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
		slider.setMaximumTrackImage(trackRightResizable, for: .normal)
	}
}

