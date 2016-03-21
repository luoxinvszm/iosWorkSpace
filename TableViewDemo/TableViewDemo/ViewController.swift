//
//  ViewController.swift
//  TableViewDemo
//
//  Created by King Luo on 3/20/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var restaurant = ["川香麻辣烫","老三鱼味管","福厨","小碗大胃","DQ icecream","纸上烤鱼","满记","茄子洽洽","星巴克","云南石锅鱼","周黑鸭","柴火鸡","傣味烧烤","日本料理"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 隐藏状态条
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // 表格区块有多少个单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return restaurant.count
    }

    // 表格相应位置的单元格，显示什么内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //用来从被回收的单元格队列中，取回一个有表示的单元格
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath)
        
        cell.textLabel?.text = restaurant[indexPath.row]
        cell.imageView?.image = UIImage(named: "basic-lifecycle")
        return cell
    }
    
    
}

