//
//  ViewController.swift
//  alcohol-or-gas
//
//  Created by Fernando Moreira on 01/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alcoholPriceTextField: UITextField!
    @IBOutlet weak var gasPriceTextField: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBAction func calculateButton(_ sender: Any) {
        
        if let alcoholPrice = alcoholPriceTextField.text {
            if let gasPrice = gasPriceTextField.text {
                
                let validateFields = self.validateFields(alcoholPrice: alcoholPrice, gasPrice: gasPrice)
                
                if validateFields {
                    self.calculateBestPrice(alcoholPrice: alcoholPrice, gasPrice: gasPrice)
                } else {
                    labelResult.text = "Digite os preços para calcular!"
                }
                
            }
        }
        
    }
    
    func calculateBestPrice (alcoholPrice: String, gasPrice: String) {
        
        if let alcohol = Double(alcoholPrice) {
            if let gas = Double(gasPrice) {
                
                /*
                To make the calculation, divide the alcohol price by the gas price
                If the result of this division >= 0.7, it's best to use gas
                Otherwise, it's best to use alcohol
                */
                
                let result = alcohol/gas
                if (result >= 0.7) {
                    self.labelResult.text = "Melhor usar Gasolina!"
                } else {
                    self.labelResult.text = "Melhor usar Álcool!"
                }
                
                
            }
        }
        
    }
    
    func validateFields (alcoholPrice: String, gasPrice: String) -> Bool {
        
        var validatedFields = true
        
        if alcoholPrice.isEmpty {
            validatedFields = false
        } else if (gasPrice.isEmpty) {
            validatedFields = false
        }
        
        return validatedFields

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

