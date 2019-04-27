//
//  FirstViewController.swift
//  To Do List
//
//  Created by Wassam Zahreddine on 2018-12-16.
//  Copyright © 2018 Wassam Zahreddine. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet var tableView: UITableView!
    
    var todoList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let todoListObj = UserDefaults.standard.object(forKey: "todoList")
        
        if let todoListItems = todoListObj as? [String] {
            todoList = todoListItems
            tableView.reloadData()
        }
        //tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
      
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
            UserDefaults.standard.set(todoList, forKey: "todoList")

        }
    }
    func addTask( newTask: String){
        todoList.append(newTask)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text  = todoList[indexPath.row]
        
            
        return cell
    }

}

