//
//  DetalhesFilmeViewController.swift
//  my-moovies-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//


import Foundation
import UIKit

class DetalhesFilmeViewController: UIViewController {
    
    
    @IBOutlet weak var FilmeImageView: UIImageView!
    @IBOutlet weak var TituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FilmeImageView.image = movie.image
        TituloLabel.text = movie.title
        descricaoLabel.text = movie.description
        
    }
    
}
