//
//  TasksTableViewController.swift
//  to-do-list
//
//  Created by Fernando Moreira on 04/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateTasksList() {
        let task = TaskUserDefaults()
        tasks = task.list()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTasksList()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let task = TaskUserDefaults()
            task.delete(index: indexPath.row)
            updateTasksList()
        }
        
        
    }
    

}
