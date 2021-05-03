//
//  ViewController.swift
//  prog-languages-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var languages: [String] = []
    var languagesDescription: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        languages.append("Swift")
        languages.append("JavaScript")
        languages.append("Kotlin")
        languages.append("Python")
        languages.append("Java")
        languages.append("C++")
        languages.append("C")
        languages.append("C#")
        languages.append("Haskell")
        
        languagesDescription.append("Swift é uma linguagem de programação desenvolvida pela Apple para desenvolvimento no iOS, macOS, watchOS, tvOS e Linux.")
        languagesDescription.append("JavaScript é uma linguagem de programação interpretada estruturada, de script em alto nível com tipagem dinâmica fraca e multiparadigma.")
        languagesDescription.append("Kotlin é uma Linguagem de programação multiplataforma, orientada a objetos e funcional, concisa e estaticamente tipada, desenvolvida pela JetBrains em 2011.")
        languagesDescription.append("Python é uma linguagem de programação de alto nível, interpretada de script, imperativa, orientada a objetos, funcional, de tipagem dinâmica e forte.")
        languagesDescription.append("Java é uma linguagem de programação orientada a objetos desenvolvida na década de 90 por uma equipe de programadores chefiada por James Gosling, na empresa Sun Microsystems.")
        languagesDescription.append("C++ é uma linguagem de programação compilada multi-paradigma e de uso geral. Desde os anos 1990 é uma das linguagens comerciais mais populares, sendo bastante usada também na academia por seu grande desempenho e base de utilizadores.")
        languagesDescription.append("C é uma linguagem de programação compilada de propósito geral, estruturada, imperativa, procedural, padronizada pela Organização Internacional para Padronização.")
        languagesDescription.append("C# é uma linguagem de programação, multiparadigma, de tipagem forte, desenvolvida pela Microsoft como parte da plataforma .NET.")
        languagesDescription.append("Haskell é uma linguagem de programação puramente funcional, de propósito geral, nomeada em homenagem ao lógico Haskell Curry.")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let cell = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        cell.textLabel?.text = languages[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // Tira o destaque da linha quando ela é clicada
        
        let alertaController = UIAlertController(title: languages[indexPath.row], message: languagesDescription[indexPath.row], preferredStyle: .alert)
        
        let acaoConfirmar = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        
        present(alertaController, animated: true, completion: nil)
    }


}

