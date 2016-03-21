//
//  ViewController.swift
//  UIControlDemo
//
//  Created by King Luo on 11/25/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editorChange(sender: AnyObject) {
         NSLog("editorChange")
    }
    
    @IBAction func editorBegin(sender: AnyObject) {
         NSLog("editorBegin")
    }
    
    @IBAction func editorEnd(sender: AnyObject) {
         NSLog("editorEnd")
    }
    @IBAction func editorEndOnExit(sender: AnyObject) {
         NSLog("editorEndOnExit")
    }
    
    
    @IBAction func buttonDragOutside(sender: AnyObject) {
        NSLog("buttonDragOutside")
    }
    @IBAction func buttonDragInside(sender: AnyObject) {
        NSLog("buttonDragInside")
    }
    @IBAction func buttonDragEnter(sender: AnyObject) {
        NSLog("buttonDragEnter")
    }

    @IBAction func buttonDownRepeat(sender: AnyObject) {
        NSLog("buttonDownRepeat")
    }
    @IBAction func buttonTouchDown(sender: AnyObject) {
        NSLog("buttonTouchDown")
    }

}

