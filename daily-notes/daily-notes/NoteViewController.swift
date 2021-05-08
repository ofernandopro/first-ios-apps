//
//  NoteViewController.swift
//  daily-notes
//
//  Created by Fernando Moreira on 07/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    
    @IBOutlet weak var text: UITextView!
    var context: NSManagedObjectContext!
    var note: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Open the keyboard automatically when the user gets to this screen:
        self.text.becomeFirstResponder()
        
        if note != nil {
            if let retrievedText = note.value(forKey: "text") {
                self.text.text = String(describing: retrievedText)
            }
        } else {
            // Initializes with an empty text:
            self.text.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext

    }
    
    @IBAction func save(_ sender: Any) {
        
        if note != nil { // update it
            self.updateNote()
        } else {
            self.saveNote()
        }
                
        // Returns to the main screen on saving:
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateNote() {
        note.setValue(self.text.text, forKey: "text")
        note.setValue(Date(), forKey: "date")
        
        do {
            try context.save()
            print("Success on update note.")
        } catch let error {
            print("Error updating note: \(error.localizedDescription)")
        }
    }
    
    func saveNote() {
        
        // Creates object for Note:
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context )
        
        // Configurates note:
        newNote.setValue(self.text.text, forKey: "text")
        newNote.setValue(Date(), forKey: "date")
        
        do {
            try context.save()
            print("Success on saving note.")
        } catch let error {
            print("Error retrieving note: \(error.localizedDescription)")
        }
        
    }

}
