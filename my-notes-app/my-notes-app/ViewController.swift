//
//  ViewController.swift
//  my-notes-app
//
//  Created by Fernando Moreira on 04/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let key = "myNote"
    @IBOutlet weak var textNote: UITextView!
    @IBAction func saveNoteButton(_ sender: Any) {
        
        if let texto = textNote.text {
            UserDefaults.standard.set(texto, forKey: key)
        }
    }
    
    func retrieveNote() -> String {
        if let retrievedText = UserDefaults.standard.object(forKey: key) {
            return retrievedText as! String
        }
        return ""
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Method is called every time user taps on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Hide keyboard whenever user touches someplace empty in the screen:
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textNote.text = retrieveNote()
        
    }


}

