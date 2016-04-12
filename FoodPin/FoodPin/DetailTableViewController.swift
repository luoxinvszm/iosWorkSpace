//
//  DetailTableViewController.swift
//  FoodPin
//
//  Created by King Luo on 3/28/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var restaurant: Restaurant!
    
    @IBOutlet weak var ratingBtg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: restaurant.image)
        
        //更改表格背景色
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        
        //去除表格分割线
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        //指定试图标题
        title = restaurant.name
        
        //若要使单元格自适应，需要设置期望行高并设置行高为 UITableViewAutomaticDimension
        //并需要将需要自适应的内容相对于其父容器的边距（顶边和底边）设置为0
        //还要将其设置为非固定行数（即，设置其lines属性为0）
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
//    override func viewDidAppear(animated: Bool) {
//        //状态栏样式（局部）
//        self.navigationController?.navigationBar.barStyle = .Black
//    }
    
    //有几个区块
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //每个区块有几行
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "餐馆名"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "类型"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "地点"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "是否到访"
            cell.valueLabel.text = restaurant.isVisited ? "已光顾" : "未尝鲜"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        //清除cell背景色
        cell.backgroundColor = UIColor.clearColor()
        
        
        
        return cell
    }
    
    //反向转场的方法
    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewVC = segue.sourceViewController as? ReviewViewController {
            if let rating = reviewVC.rating {
                self.restaurant.rating = rating
                self.ratingBtg.setImage(UIImage(named:rating), forState: .Normal)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showReview" {
            let destVC = segue.destinationViewController as! ReviewViewController
            
            destVC.imgName = restaurant.image
            
        }
        
        if segue.identifier == "showMap" {
            let destVC = segue.destinationViewController as! MapViewController
            
            destVC.restaurant = self.restaurant
        }
        
    }
    
    
}
