//
//  MovieDetailsViewController.swift
//  my-movies-app
//
//  Created by Fernando Moreira on 04/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
   
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImageView.image = movie.image
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
        
    }
    
}
