//
//  ViewController.swift
//  prize-draw-app
//
//  Created by Fernando Moreira on 29/04/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textResult: UILabel!
    @IBOutlet weak var typedNumber: UITextField!
    
    @IBAction func buttonGenerate(_ sender: Any) {
                
        let maxNumber = UInt32(typedNumber.text!) ?? 0
            
        let number = Int(arc4random_uniform(maxNumber) + 1)
        textResult.text = String(number)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

