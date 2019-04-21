//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Hai Vu on 4/20/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
	
	private weak var aboutView: AboutView! {
		guard isViewLoaded else {
			return nil
		}
		return (view as! AboutView)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
			let request = URLRequest(url: url)
			aboutView.webview.load(request)
		}
	}
	@IBAction func close() {
		dismiss(animated: true, completion: nil)
	}
}
