//
//  ViewController.swift
//  dog-age
//
//  Created by Fernando Moreira on 27/04/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBAction func showAgeButton(_ sender: Any) {
        let idade = Int(ageTextField.text!)! * 7
        ageLabel.text = String(idade)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }


}

