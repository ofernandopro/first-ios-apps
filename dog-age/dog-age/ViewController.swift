//
//  ViewController.swift
//  dog-age
//
//  Created by Fernando Moreira on 05/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        
        let age = Int(ageTextField.text!)! * 7
        resultLabel.text = String(age)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

