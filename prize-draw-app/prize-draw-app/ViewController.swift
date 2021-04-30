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
    @IBAction func buttonGenerate(_ sender: Any) {
        
        let number = Int(arc4random_uniform(10) + 1)
        textResult.text = String(number)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }


}

