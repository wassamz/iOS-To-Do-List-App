//
//  SecondViewController.swift
//  To Do List
//
//  Created by Wassam Zahreddine on 2018-12-16.
//  Copyright © 2018 Wassam Zahreddine. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var newTaskTextField: UITextField!
    @IBAction func addTaskButton(_ sender: Any) {
        let todoListObj = UserDefaults.standard.object(forKey: "todoList")
        var todoList:[String] = []
        
        if let tempTodoList = todoListObj as? [String] {
            todoList = tempTodoList
            todoList.append(newTaskTextField.text!)
            print(todoList)
        }else {
            todoList = [newTaskTextField.text!]
        }
        UserDefaults.standard.set(todoList, forKey: "todoList")
        newTaskTextField.text = ""
        newTaskTextField.placeholder = "add another task"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

