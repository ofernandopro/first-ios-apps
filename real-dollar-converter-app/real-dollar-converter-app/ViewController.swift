//
//  ViewController.swift
//  real-dollar-converter-app
//
//  Created by Fernando Moreira on 21/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var doConversion: UIButton! // Outlet because we'll change the button text when updating
    
    @IBAction func calculateButton(_ sender: Any) {
        self.doConversionToReal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.doConversionToReal()
    }
    
    func formatValue(price: NSNumber) -> String {
        
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        
        if let finalValue = nf.string(from: price) {
            return finalValue
        }
        
        return "0,00"
        
    }
    
    func doConversionToReal() {
        
        self.doConversion.setTitle("Atualizando...", for: .normal)
        if let url = URL(string: "https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL") {
            // Fica executando até termos o retorno da requisição
            let task = URLSession.shared.dataTask(with: url) { (data, request, error) in
                
                if error == nil {
                    
                    if let returnData = data {
                        
                        do {
                            if let objectJSON = try JSONSerialization.jsonObject(with: returnData, options: []) as? [String: Any] {
                                
                                if let usdBrl = objectJSON["USDBRL"] as? [String: Any] {
                                    if let dollarPrice = usdBrl["high"] as? String {
                                        let dollarPriceNumber = Double(dollarPrice)
                                        let formattedPrice = self.formatValue(price: NSNumber(value: dollarPriceNumber!))
                                                                                
                                        DispatchQueue.main.async(execute: {
                                            self.priceText.text = "R$ " + formattedPrice
                                            self.doConversion.setTitle("Atualizar", for: .normal)
                                        })
                                        
                                    }
                                }
                                
                            }
                        } catch {
                            print("erro")
                        }
                        
                    }
                    
                } else {
                    print("Erro")
                }
                
            }
            task.resume() // inicia a requisição
        }
    }


}

