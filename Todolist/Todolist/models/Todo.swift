//
//  Todo.swift
//  Todolist
//
//  Created by jelly on 07/07/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import Foundation

class Todo {
    var isChecked = false
    var title = ""
    
    
    func toggleChecked() {
        isChecked = !isChecked
    }
}
