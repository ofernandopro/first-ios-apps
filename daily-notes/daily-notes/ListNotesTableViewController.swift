//
//  ListNotesTableViewController.swift
//  daily-notes
//
//  Created by Fernando Moreira on 07/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit
import CoreData

class ListNotesTableViewController: UITableViewController {

    var context: NSManagedObjectContext!
    var notes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.retrieveNotes()
    }
    
    func retrieveNotes() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        // Sorting by the date with descending order:
        let ordering = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [ordering]
        
        do {
            
            let retrievedNotes = try context.fetch(request)
            self.notes = retrievedNotes as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch let error {
            print("Error retrieving note: \(error.localizedDescription)")
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let index = indexPath.row
        let note = self.notes[index]
        self.performSegue(withIdentifier: "seeNote", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeNote" {
            let viewDestiny = segue.destination as! NoteViewController
            viewDestiny.note = sender as? NSManagedObject
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let note = self.notes[indexPath.row]
        let retrievedText = note.value(forKey: "text")
        let retrievedDate = note.value(forKey: "date")
        
        // Formats date:
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        let newDate = dateFormatter.string(from: retrievedDate as! Date)
        
        cell.textLabel?.text = retrievedText as? String
        cell.detailTextLabel?.text = newDate

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let note = self.notes[indexPath.row]
            
            self.context.delete(note) // Removes from Data Base
            self.notes.remove(at: indexPath.row) // Removes from Array
            self.tableView.deleteRows(at: [indexPath], with: .automatic) // Removes from table
            
            do {
                try self.context.save()
            } catch let error {
                print("Erro ao remover item \(error)")
            }
            
        }
        
    }

}
