//
//  ViewController.swift
//  Trivia
//
//  Created by kaiba on 2016/03/27.
//  Copyright © 2016年 kaiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    private var heeCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func heeAction() {
        heeCount += 1;
        label.text = "\(heeCount)へぇ"
    }
}
