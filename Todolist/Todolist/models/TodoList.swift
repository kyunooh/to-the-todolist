//
//  TodoList.swift
//  Todolist
//
//  Created by jelly on 07/07/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import Foundation

class TodoList {
    var todoList: [Todo] = []
    
    init() {
        let todo1 = Todo()
        let todo2 = Todo()
        
        todo1.title = "Create IOS todo list"
        todo2.title = "Start broadcast"
        todo2.isChecked = true
        
        todoList.append(todo1)
        todoList.append(todo2)
    }
    
    
    func add(todo: Todo) {
        todoList.append(todo)
    }
    
    
    func remove(todo: Todo) {
        let indexForRemove = todoList.index(of: todo)
        todoList.remove(at: indexForRemove)
    }
    
}
