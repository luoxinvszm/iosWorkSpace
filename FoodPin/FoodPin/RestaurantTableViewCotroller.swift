//
//  RestaurantTableViewCotroller.swift
//  FoodPin
//
//  Created by King Luo on 3/20/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class RestaurantTableViewCotroller: UITableViewController {

//    var restaurant = ["咖啡胡同","霍米","茶。家","洛伊斯咖啡","贝蒂生蚝","福奇餐馆","阿波画室","小碗大胃","虾吃虾涮","福厨","纸上烤鱼",
//        "伯克街面包坊","嘉华饼屋","黑氏巧克力","惠灵顿雪梨","布鲁克林塔菲","格雷厄姆大街肉","华夫饼 & 沃夫","眼光咖啡","震颤酒吧","巴拉菲娜","多尼西亚","皇家橡树","秦咖啡"]
//    
//    var rType = ["西餐","西餐","中餐","西餐","海鲜","广式","休闲","中餐","火锅","中餐","烧烤",
//        "糕点","糕点","零食","水果","西餐","烤肉","面包","饮品","休闲","西餐","西餐","中餐","饮品"]
//    
//    var rLocation = ["上海","北京","杭州","西南","海南","广州","西安","大理","丽江","昆明","西双版纳",
//        "会泽","曲靖","宜昌","武汉","长沙","贵阳","成都","重庆","施恩","长阳","陆良","大海草上","呼和浩特"]
//    
//    var rImg = ["0","1","2","3","4","5","06","07","08","09","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024"]
//
//    
//    //用于保存所有cell的选中状态
//    var status = [Bool](count:25, repeatedValue:false)
    var restaurants = [
        Restaurant(name:"咖啡胡同",type:"西餐",location:"上海",image:"0",isVisited:false) ,
        Restaurant(name:"霍米",type:"西餐",location:"北京",image:"1",isVisited:false) ,
        Restaurant(name:"茶。家",type:"中餐",location:"杭州",image:"2",isVisited:false) ,
        Restaurant(name:"洛伊斯咖啡",type:"西餐",location:"西南",image:"3",isVisited:false) ,
        Restaurant(name:"贝蒂生蚝",type:"海鲜",location:"海南",image:"4",isVisited:false) ,
        Restaurant(name:"福奇餐馆",type:"广式",location:"广州",image:"5",isVisited:false) ,
        Restaurant(name:"阿波画室",type:"休闲",location:"西安",image:"06",isVisited:false) ,
        Restaurant(name:"小碗大胃",type:"中餐",location:"大理",image:"07",isVisited:false) ,
        Restaurant(name:"虾吃虾涮",type:"火锅",location:"丽江",image:"08",isVisited:false) ,
        Restaurant(name:"福厨",type:"中餐",location:"昆明",image:"09",isVisited:false) ,
        Restaurant(name:"纸上烤鱼",type:"烧烤",location:"西双版纳",image:"010",isVisited:false) ,
        Restaurant(name:"伯克街面包坊",type:"糕点",location:"会泽",image:"011",isVisited:false) ,
        Restaurant(name:"嘉华饼屋",type:"糕点",location:"曲靖",image:"012",isVisited:false) ,
        Restaurant(name:"黑氏巧克力",type:"零食",location:"宜昌",image:"013",isVisited:false) ,
        Restaurant(name:"惠灵顿雪梨",type:"水果",location:"武汉",image:"014",isVisited:false) ,
        Restaurant(name:"布鲁克林塔菲",type:"西餐",location:"长沙",image:"015",isVisited:false) ,
        Restaurant(name:"格雷厄姆大街肉",type:"烤肉",location:"贵阳",image:"016",isVisited:false) ,
        Restaurant(name:"华夫饼 & 沃夫",type:"面包",location:"成都",image:"017",isVisited:false) ,
        Restaurant(name:"眼光咖啡",type:"饮品",location:"重庆",image:"018",isVisited:false) ,
        Restaurant(name:"震颤酒吧",type:"休闲",location:"施恩",image:"019",isVisited:false) ,
        Restaurant(name:"巴拉菲娜",type:"西餐",location:"长阳",image:"020",isVisited:false) ,
        Restaurant(name:"多尼西亚",type:"西餐",location:"陆良",image:"021",isVisited:false) ,
        Restaurant(name:"皇家橡树",type:"中餐",location:"大海草上",image:"022",isVisited:false) ,
        Restaurant(name:"秦咖啡",type:"饮品",location:"呼和浩特",image:"023",isVisited:false) ,

    ]
    
    
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
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.name.text = restaurants[indexPath.row].name
        cell.type.text = restaurants[indexPath.row].type
        cell.location.text = restaurants[indexPath.row].location
        cell.img.image = UIImage(named: restaurants[indexPath.row].image)
        cell.img.layer.cornerRadius = cell.img.frame.size.width / 2 //图片圆角化，正方形内切圆半径为正方形边长一半
        cell.img.clipsToBounds = true//图片布局生效
       
        
        
        //修复“一炮双响”
//        if status[indexPath.row] == true {
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        cell.favImg.image = UIImage(named: "heart")
        cell.favImg.hidden = restaurants[indexPath.row].isVisited ? false : true

        return cell
    }

    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //选中行执行的操作
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: "亲，您选择了我", message: "消息", preferredStyle: .ActionSheet)
//        
//        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
//        
//        let callHandler = {(action:UIAlertAction) -> Void in
//            let alert = UIAlertController(title: "提示", message: "您拨打的电话暂时无法接通", preferredStyle: .Alert)
//            let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
//            alert.addAction(action)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "拨打 021-6532 \(indexPath.row)", style: .Default, handler: callHandler)
//        
//        let visted = UIAlertAction(title: "我来过", style: .Default) { (_) -> Void in
//          //  let cell = tableView.cellForRowAtIndexPath(indexPath)
//            
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
//            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
//            cell.favImg.hidden = false
//           
//            self.status[indexPath.row] = true
//        }
//        
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(visted)
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.滑动操作单元格
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurants.removeAtIndex(indexPath.row)
            //tableView.reloadData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)//删除行，并有滑动效果
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //实现该方法后，系统将不再提供滑动删除
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) -> Void in
            let alert = UIAlertController(title: "分享到", message: "请选择你要分享到的社交类型", preferredStyle: .ActionSheet)
            
            let qqAction = UIAlertAction(title: "QQ", style: .Default, handler: nil)
            let sinaAction = UIAlertAction(title: "新浪微博", style: .Default, handler: nil)
            let weChatAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            
            alert.addAction(qqAction)
            alert.addAction(sinaAction)
            alert.addAction(weChatAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 218/255, green: 225/255, blue: 218/255, alpha: 0.7)
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)//删除行，并有滑动效果
        }
        return [shareAction,deleteAction]
    }


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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRestaurantDetail" {
            let destVC = segue.destinationViewController as! RestaurantDetailsViewController
            
            let position = tableView.indexPathForSelectedRow!.row
            destVC.restaurantImage = restaurants[position].image
            destVC.restaurantName = restaurants[position].name
            destVC.restaurantType = restaurants[position].type
            destVC.restaurantLocation = restaurants[position].location
            
        }
        
    }
 

}
