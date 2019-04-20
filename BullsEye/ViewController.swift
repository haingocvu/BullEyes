//
//  ViewController.swift
//  BullsEye
//
//  Created by Hai Vu on 4/17/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	var currentValue = 0
	var targetValue = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		startNewRound()
	}
	
	@IBAction func showAlert() {
		let message = "the value of slider is: \(currentValue)" + "\nthe targeted value is: \(targetValue)"
		let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
		let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(alertAction)
		present(alert, animated: true, completion: nil)
		startNewRound()
	}
	@IBAction func sliderMove(_ slider: UISlider) {
		currentValue = lroundf(slider.value)
	}
	func startNewRound() {
		targetValue = Int.random(in: 1...100)
		currentValue = 50
		slider.value = Float(currentValue)
		updateLabels()
	}
	func updateLabels() {
		targetLabel.text = String(targetValue)
	}
}

