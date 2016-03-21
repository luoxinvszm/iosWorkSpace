//
//  ViewController.swift
//  LabelDemo
//
//  Created by King Luo on 11/25/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label1.textAlignment = NSTextAlignment.Center
        
        var label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label2.text = "hello label2"
        self.view.addSubview(label2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

