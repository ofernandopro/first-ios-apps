//
//  TaskUserDefaults.swift
//  to-do-list
//
//  Created by Fernando Moreira on 04/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import UIKit

class TaskUserDefaults {
    
    let key = "todoList"
    var tasks: [String] = []
    
    func save(task: String) {
        
        /* Retrieves tasks already saved: */
        tasks = list()
        
        tasks.append(task)
        UserDefaults.standard.set(tasks, forKey: key)
        
    }
    
    func list() -> Array<String> {
        
        let data = UserDefaults.standard.object(forKey: key)
        
        if data != nil {
            return data as! Array<String>
        } else {
            return []
        }
        
    }
    
    func delete (index: Int) {
        
        /* Retrieves tasks already saved: */
        tasks = list()
        
        tasks.remove(at: index)
        
        /* Saving the array: */
        UserDefaults.standard.set(tasks, forKey: key)
        
    }
    
}
