//
//  ViewController.swift
//  heads-or-tails-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jogarMoeda" {
            let vcDestino = segue.destination as! DetalhesViewController
            
            vcDestino.numeroRandomico = Int(arc4random_uniform(2))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

