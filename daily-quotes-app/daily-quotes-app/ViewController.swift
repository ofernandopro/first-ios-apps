//
//  ViewController.swift
//  daily-quotes-app
//
//  Created by Fernando Moreira on 01/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBAction func newQuoteButton(_ sender: Any) {
        
        var quotes: [String] = []
        quotes.append("Se você traçar metas absurdamente altas e falhar, seu fracasso será muito melhor que o sucesso de todos.")
        quotes.append("Ter sucesso é falhar repetidamente, mas sem perder o entusiasmo.")
        quotes.append("Não é o mais forte que sobrevive, nem o mais inteligente, Quem sobrevive é o mais disposto à mudança.")
        quotes.append("Nenhum obstáculo será grande se a sua vontade de vencer for maior.")
        quotes.append("Dificuldades preparam pessoas comuns para destinos extraordinários.")
        quotes.append("Nenhum homem será um grande líder se quiser fazer tudo sozinho ou se quiser levar todo o crédito por fazer isso.")
        quotes.append("Bom mesmo é ir à luta com determinação, abraçar a vida com paixão, perder com classe e vencer com ousadia, porque o mundo pertence a quem se atreve e a vida é muito curta, para ser insignificante.")
        quotes.append("Pessoas vencedoras não são aquelas que não falham, são aquelas que não desistem.")
        
        
        let number = Int(arc4random_uniform(6) + 1)
        
        quoteLabel.text = quotes[number]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

