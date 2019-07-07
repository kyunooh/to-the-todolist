//
//  ViewController.swift
//  Todolist
//
//  Created by jelly on 07/07/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import UIKit

class TodoListController: UITableViewController {
    
    var todoList: TodoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todoList.todoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        configureCell(for: cell, todo: todo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList.todoList[indexPath.row]
        todo.toggleChecked()
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        configureCell(for: cell, todo: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCell(for cell: UITableViewCell, todo: Todo) {
        guard let todoCell = cell as? TodoTableViewCell else {
            return
        }
        if(todo.isChecked) {
            todoCell.checkmarkLabel.text = "√"
        } else {
            todoCell.checkmarkLabel.text = ""
        }
        todoCell.todoLabel.text = todo.title
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTodoSegue" {
            if let destination = segue.destination as? TodoDetailTableViewController {
                destination.delegate = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let todo = todoList.todoList[indexPath.row]
        let indexPaths = [indexPath]
        todoList.remove(todo: todo)
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}

extension TodoListController: TodoDetailTableViewDelegate {
    func add(todoToAdd todo: Todo) {
        todoList.add(todo: todo)
        let rowIndex = todoList.todoList.count - 1
        let indexPath = IndexPath.init(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func edit(todoToEdit todo: Todo) {
        
    }
    
    
}
