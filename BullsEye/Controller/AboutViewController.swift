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
	
	@IBOutlet weak var webview: WKWebView!
	override func viewDidLoad() {
		super.viewDidLoad()
		if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
			let request = URLRequest(url: url)
			webview.load(request)
		}
	}
	@IBAction func close() {
		dismiss(animated: true, completion: nil)
	}
}
