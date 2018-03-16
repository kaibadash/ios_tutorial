//
//  TodoEditController.swift
//  ToDo
//
//  Created by kaiba on 2016/03/27.
//  Copyright © 2016年 kaiba. All rights reserved.
//

import UIKit

// 親に削除を伝えるためのインタフェース
protocol TodoEditControllerDelegate {
    func deleteTodo(todo: ToDo)
}

class TodoEditController: UIViewController {
    @IBOutlet var textView: UITextView!
    var delegate: TodoEditControllerDelegate? = nil
    var todo: ToDo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = todo?.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveAction() {
        todo?.title = textView.text!
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteAction() {
        delegate!.deleteTodo(todo: todo!)
        _ = navigationController?.popViewController(animated: true)
    }
}
