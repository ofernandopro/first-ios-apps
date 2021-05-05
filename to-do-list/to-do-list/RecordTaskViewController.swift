//
//  RecordTaskViewController.swift
//  to-do-list
//
//  Created by Fernando Moreira on 04/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class RecordTaskViewController: UIViewController {
    
    @IBOutlet weak var taskField: UITextView!
    
    @IBAction func saveTaskButton(_ sender: Any) {
        
        if let typedText = taskField.text {
            
            let task = TaskUserDefaults()
            task.save(task: typedText)
            
            taskField.text = ""
            
            let data = task.list()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
