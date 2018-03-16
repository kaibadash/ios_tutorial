//
//  ViewController.swift
//  ToDo
//
//  Created by kaiba on 2016/03/27.
//  Copyright © 2016年 kaiba. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, TodoEditControllerDelegate {
    
    private var todoList: [ToDo] = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: 本来、ここでAPIかローカルDBなどからリストを取得すべきでしょう。
    }
    
    // 編集画面から戻ってきた時、再描画しないと変更が反映されないため
    // TODO:本当はちゃんと編集画面で変更があったことを受け取って再描画するべきです
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addTodo() {
        // TODO:ここでダイアログなどで入力させると親切かも
        todoList.append(ToDo(title:"新しいTODO\(todoList.count)"))
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID: String = "cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        let todo: ToDo = todoList[indexPath.row]
        cell!.textLabel!.text = todo.title
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo: ToDo = todoList[indexPath.row]
        let editController: TodoEditController = storyboard?.instantiateViewController(withIdentifier: "TodoEditController") as! TodoEditController!
        editController.delegate = self
        editController.todo = todo
        navigationController?.pushViewController(editController, animated: true)
    }
    
    // TodoEditControllerDelegate
    func deleteTodo(todo: ToDo) {
        if let index: Int = todoList.index(where: {$0 === todo}) {
            todoList.remove(at: index)
        }
        
    }
}

