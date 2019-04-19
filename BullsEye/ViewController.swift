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
	var currentValue = 0
	var targetValue = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		currentValue = lroundf(slider.value)
		targetValue = Int.random(in: 1...100)
	}
	
	@IBAction func showAlert() {
		let message = "the value of slider is: \(currentValue)"
		let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
		let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(alertAction)
		present(alert, animated: true, completion: nil)
	}
	@IBAction func sliderMove(_ slider: UISlider) {
		currentValue = lroundf(slider.value)
	}
}

