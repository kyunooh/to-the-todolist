//
//  TodoDetailTableViewController.swift
//  Todolist
//
//  Created by jelly on 07/07/2019.
//  Copyright © 2019 jellyms. All rights reserved.
//

import UIKit


protocol TodoDetailTableViewDelegate: class {
    func add(todoToAdd todo: Todo)
    func edit(todoToEdit todo: Todo)
}



class TodoDetailTableViewController: UITableViewController {
    weak var todoList: TodoList?
    weak var todoToEdit: Todo?
    weak var delegate: TodoDetailTableViewDelegate?
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        if let todo = todoToEdit {
            todo.title = todoText.text!
            delegate!.edit(todoToEdit: todo)
        } else {
            let todo = Todo()
            todo.title = todoText.text!
            delegate!.add(todoToAdd: todo)
        }
    }
    
    
    @IBOutlet weak var todoText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        todoText.becomeFirstResponder()
    }

}

extension TodoDetailTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        todoText.resignFirstResponder()
        return true
    }
    
}
