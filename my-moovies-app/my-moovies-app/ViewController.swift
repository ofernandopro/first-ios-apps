//
//  ViewController.swift
//  my-moovies-app
//
//  Created by Fernando Moreira on 03/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var movie: Movie
        
        movie = Movie(title: "007 - Spectre", description: "James Bond chega à Cidade do México e está pronto para eliminar Marco Sciarra sem que o chef M saiba da missão.", image: UIImage(named: "filme1")!)
        movies.append(movie)
        
        movie = Movie(title: "Star Wars", description: "Star Wars é uma franquia do tipo space opera estadunidense criada pelo cineasta George Lucas.", image: UIImage(named: "filme2")!)
        movies.append(movie)
        
        movie = Movie(title: "Impacto Mortal", description: "Colt e John são pistoleiros e amantes ocasionais. Vivendo entre os encontros e desencontros, eles gostam mesmo é da adrenalina proporcionada pelas aventuras paralelas e pelos duelos perigosos de que participam na América do Sul.", image: UIImage(named: "filme3")!)
        movies.append(movie)
        
        movie = Movie(title: "Deadpool", description: "Wade Wilson é um ex-agente especial que passou a trabalhar como mercenário. Seu mundo é destruído quando um cientista maligno o tortura e o desfigura completamente", image: UIImage(named: "filme4")!)
        movies.append(movie)
        
        movie = Movie(title: "O Regresso", description: "Após ser atacado por um urso, o caçador Hugh Glass é abandonado na floresta por seu companheiro John Fitzgerald. Apesar de muito ferido, Glass consegue sobreviver e vai em busca de vingança.", image: UIImage(named: "filme5")!)
        movies.append(movie)
        
        movie = Movie(title: "A Herdeira", description: "A herdeira é o quarto livro da série de livros A Seleção.", image: UIImage(named: "filme6")!)
        movies.append(movie)
        
        movie = Movie(title: "Caçadores de emoção", description: "Após uma série de assaltos a bancos bizarros no sul da Califórnia, com os bandidos usando máscaras de vários ex-presidentes, o agente federal Johnny Utah se infiltra na gangue suspeita de ter cometido os crimes. ", image: UIImage(named: "filme7")!)
        movies.append(movie)
        
        movie = Movie(title: "Regresso do mal", description: "Assombrado por imagens assustadoras e mensagens inexplicáveis, um homem tenta descobrir o mistério por trás do desaparecimento de seu filho.", image: UIImage(named: "filme8")!)
        movies.append(movie)
        
        movie = Movie(title: "Tarzan", description: "Tarzan ou Tarzã é um personagem de ficção criado pelo escritor estadunidense Edgar Rice Burroughs na revista pulp All-Story Magazine em 1912 e publicado em formato livro em 1914.", image: UIImage(named: "filme9")!)
        movies.append(movie)
        
        movie = Movie(title: "Hardcore", description: "Hardcore é um filme de drama estadunidense de 1979 escrito e dirigido por Paul Schrader e estrelado por George C. Scott, Peter Boyle e Season Hubley.", image: UIImage(named: "filme10")!)
        movies.append(movie)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // On clicking in a line, do:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let movie = movies[indexPath.row]
        
        let reuseCell = "reuseCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as! MovieCell
        
        let shortDescription = movie.description.prefix(25)
        
        cell.movieImageView.image = movie.image
        cell.titleLabel.text = movie.title
        cell.descriptionLabel.text = String(shortDescription)
        
        // Round the image:
        cell.movieImageView.layer.cornerRadius = 45
        cell.movieImageView.clipsToBounds = true
        
        // Change the color of the text of the line
        cell.textLabel?.textColor = UIColor.white
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetails" {
            
            // Recupera a linha clicada:
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedMovie = self.movies[indexPath.row]
                let viewControllerDestiny = segue.destination as! MovieDetailsViewController
                
                viewControllerDestiny.movie = selectedMovie
            }
        }
    }

}

