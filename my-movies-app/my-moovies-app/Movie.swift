//
//  Movie.swift
//  my-moovies-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class Movie {
    
    var title: String!
    var description: String!
    var image: UIImage!
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
    
}
