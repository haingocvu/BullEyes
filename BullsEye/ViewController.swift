//
//  ViewController.swift
//  BullsEye
//
//  Created by Hai Vu on 4/17/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "This is my first app", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}

