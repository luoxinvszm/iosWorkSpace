//
//  RestaurantTableViewCotroller.swift
//  FoodPin
//
//  Created by King Luo on 3/20/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class RestaurantTableViewCotroller: UITableViewController {

    var restaurant = ["咖啡胡同","霍米","茶。家","洛伊斯咖啡","贝蒂生蚝","福奇餐馆","阿波画室","小碗大胃","虾吃虾涮","福厨","纸上烤鱼",
        "伯克街面包坊","嘉华饼屋","黑氏巧克力","惠灵顿雪梨","布鲁克林塔菲","格雷厄姆大街肉","华夫饼 & 沃夫","眼光咖啡","震颤酒吧","巴拉菲娜","多尼西亚","皇家橡树","秦咖啡"]
    
    var rType = ["西餐","西餐","中餐","西餐","海鲜","广式","休闲","中餐","火锅","中餐","烧烤",
        "糕点","糕点","零食","水果","西餐","烤肉","面包","饮品","休闲","西餐","西餐","中餐","饮品"]
    
    var rLocation = ["上海","北京","杭州","西南","海南","广州","西安","大理","丽江","昆明","西双版纳",
        "会泽","曲靖","宜昌","武汉","长沙","贵阳","成都","重庆","施恩","长阳","陆良","大海草上","呼和浩特"]
    
    var rImg = ["0","1","2","3","4","5","06","07","08","09","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024"]

    
    //用于报错所有cell的选中状态
    var status = [Bool](count:21, repeatedValue:false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // 默认为1，表示表格的列数
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurant.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.name.text = restaurant[indexPath.row]
        cell.type.text = rType[indexPath.row]
        cell.location.text = rLocation[indexPath.row]
        cell.img.image = UIImage(named: rImg[indexPath.row])
        cell.img.layer.cornerRadius = cell.img.frame.size.width / 2 //图片圆角化，正方形内切圆半径为正方形边长一半
        cell.favImg.image = UIImage(named: "heart")
        cell.favImg.hidden = status[indexPath.row] ? false : true
      
        
        cell.img.clipsToBounds = true//图片布局生效
       
        
        
        //修复“一炮双响”
//        if status[indexPath.row] == true {
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
        //cell.accessoryType = status[indexPath.row] ? .Checkmark : .None
        
        return cell
    }

    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //选中行执行的操作
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: "亲，您选择了我", message: "消息", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        let callHandler = {(action:UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您拨打的电话暂时无法接通", preferredStyle: .Alert)
            let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "拨打 021-6532 \(indexPath.row)", style: .Default, handler: callHandler)
        
        let visted = UIAlertAction(title: "我来过", style: .Default) { (_) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            
            self.status[indexPath.row] = true
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(visted)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
