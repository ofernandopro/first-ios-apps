//
//  DetalhesViewController.swift
//  heads-or-tails-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var numeroRandomico: Int!

    @IBOutlet weak var moedaImagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numeroRandomico == 0 { // cara
            moedaImagem.image = UIImage(named:"moeda_cara")
        } else { // coroa
            moedaImagem.image = UIImage(named:"moeda_coroa")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
