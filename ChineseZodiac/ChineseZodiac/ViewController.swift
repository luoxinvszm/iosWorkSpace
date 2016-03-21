//
//  ViewController.swift
//  ChineseZodiac
//
//  Created by King Luo on 11/22/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearOfBirth: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var zodiac: UITextField!
    
    let offset = 4
    
    let map = [0 : "鼠", 1 : "牛", 2 : "虎", 3 : "兔", 4 : "龙", 5 : "蛇", 6 : "马", 7 : "羊", 8 : "猴", 9 : "鸡", 10 : "狗", 11 : "猪"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        yearOfBirth.resignFirstResponder()
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        yearOfBirth.resignFirstResponder()
        
        if let year = yearOfBirth.text.toInt() {
            var imageNumber = (year - offset) % 12
            zodiac.text = map[imageNumber]
            image.image = UIImage(named: String(imageNumber))
        } else {
            //notify the user
        }
    }

}

