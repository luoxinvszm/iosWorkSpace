//
//  RestaurantTableViewCotroller.swift
//  FoodPin
//
//  Created by King Luo on 3/20/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit
import CoreData

//NSFetchedResultsControllerDelegate 用于处理CoreData在tableView上的操作，提供数据变化时通知其代理的方法
//UISearchResultsUpdating 用于响应搜索条搜索更新
class RestaurantTableViewCotroller: UITableViewController,NSFetchedResultsControllerDelegate,UISearchResultsUpdating {

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
//    var restaurants = [
//        Restaurant(name:"咖啡胡同",type:"西餐",location:"中国上海市浦东新区1600号陆家嘴商务广场2301室",image:"0",isVisited:false) ,
//        Restaurant(name:"霍米",type:"西餐",location:"香港上环德辅道西78号G/F",image:"1",isVisited:false) ,
//        Restaurant(name:"茶。家",type:"中餐",location:"香港上环文咸东街太平山22-24A，B店",image:"2",isVisited:false) ,
//        Restaurant(name:"洛伊斯咖啡",type:"西餐",location:"香港葵涌和宜合道熟食市场地下",image:"3",isVisited:false) ,
//        Restaurant(name:"贝蒂生蚝",type:"海鲜",location:"香港新界葵涌屏富径",image:"4",isVisited:false) ,
//        Restaurant(name:"福奇餐馆",type:"广式",location:"香港九龙尖沙咀河内道18号(近港铁尖东站N3,N4出口)",image:"5",isVisited:false) ,
//        Restaurant(name:"阿波画室",type:"休闲",location:"香港岛中环都爹利街13号乐成行地库中层",image:"06",isVisited:false) ,
//        Restaurant(name:"小碗大胃",type:"中餐",location:"香港岛铜锣湾轩尼诗道555号崇光百货地库2楼30号铺",image:"07",isVisited:false) ,
//        Restaurant(name:"虾吃虾涮",type:"火锅",location:"4 Hickson Rd、The Rocks NSW 2000",image:"08",isVisited:false) ,
//        Restaurant(name:"福厨",type:"中餐",location:"31 Wheat Rd、Sydney NSW 2001",image:"09",isVisited:false) ,
//        Restaurant(name:"纸上烤鱼",type:"烧烤",location:"1/11-31 York Street Sydney NSW Australia、Sydney NSW 2000",image:"010",isVisited:false) ,
//        Restaurant(name:"伯克街面包坊",type:"糕点",location:"Macy's、151 W 34th St Fifth Floor、New York, NY 10001",image:"011",isVisited:false) ,
//        Restaurant(name:"嘉华饼屋",type:"糕点",location:"250 8th Ave、New York, NY 10107",image:"012",isVisited:false) ,
//        Restaurant(name:"黑氏巧克力",type:"零食",location:"55-1 Riverwalk Pl、West New York, NJ 07093",image:"013",isVisited:false) ,
//        Restaurant(name:"惠灵顿雪梨",type:"水果",location:"1585 Broadway、New York, NY 10036-8200",image:"014",isVisited:false) ,
//        Restaurant(name:"布鲁克林塔菲",type:"西餐",location:"1460 Broadway、New York, NY 10036",image:"015",isVisited:false) ,
//        Restaurant(name:"格雷厄姆大街肉",type:"烤肉",location:"250 8th Ave、New York, NY 10107",image:"016",isVisited:false) ,
//        Restaurant(name:"华夫饼 & 沃夫",type:"面包",location:"822 Lexington Ave、New York, NY 10065",image:"017",isVisited:false) ,
//        Restaurant(name:"眼光咖啡",type:"饮品",location:"Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA",image:"018",isVisited:false) ,
//        Restaurant(name:"震颤酒吧",type:"休闲",location:"Waterloo Station、London SE1 7LY",image:"019",isVisited:false) ,
//        Restaurant(name:"巴拉菲娜",type:"西餐",location:"Unit 4a、44-58 Brompton Rd、London SW3 1BW",image:"020",isVisited:false) ,
//        Restaurant(name:"多尼西亚",type:"西餐",location:"7-9 Golders Green Rd、London NW11 8DY",image:"021",isVisited:false) ,
//        Restaurant(name:"皇家橡树",type:"中餐",location:"7-8 Golders Green Rd、London NW11 8DY",image:"022",isVisited:false) ,
//        Restaurant(name:"秦咖啡",type:"饮品",location:"Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA",image:"023",isVisited:false) ,
//
//    ]
    var sr: [Restaurant] = [] //用于保存搜索结果
    var restaurants:[Restaurant] = []
    var frv: NSFetchedResultsController!
    var sv: UISearchController!
    
    //实现UISearchResultsUpdating协议需要实现此方法，当用户点搜索条，或者更改所搜文字，这个方法或被调用，通过实现这个方法，我们让搜索条控制器显示所搜结果
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if var textToSearch = sv.searchBar.text{
            //过滤搜索串中的空格
            textToSearch = textToSearch.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            
            searchFilter(textToSearch)
            tableView.reloadData()
        }
    }
    
    // 添加一个筛选器方法，返回包含搜索字符串的所有餐馆
    func searchFilter(textToSearch: String){//Swift 中数组自带filter方法，参数是一个闭包。筛选符合条件的元素，组成一个新数据的返回
        sr = restaurants.filter({ (r) -> Bool in
            return r.name.containsString(textToSearch)
        })
        sr = restaurants.filter({ (r) -> Bool in
            return r.location.containsString(textToSearch)
        })

    }
    
    //设置导航页
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.boolForKey("GuiderShowed") {
            return
        }
        
        if let pageVC = storyboard?.instantiateViewControllerWithIdentifier("GuideController") as? GuiderPageViewController {
            presentViewController(pageVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        sv.searchResultsUpdater = self//搜索更新控制器设置为自身
//        sv.dimsBackgroundDuringPresentation = false//搜索过背景不变暗
        
        //将导航返回按钮设置为仅有箭头
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        //若要使单元格自适应，需要设置期望行高并设置行高为 UITableViewAutomaticDimension
        //并需要将需要自适应的内容相对于其父容器的边距（顶边和底边）设置为0
        //还要将其设置为非固定行数（即，设置其lines属性为0）
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //取回数据
        //1.获取AppDelegate中托管缓冲区对象
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        //2.使用NSFetchRequest
        let request = NSFetchRequest(entityName: "Restaurant")//请求指定entity
        request.sortDescriptors = [NSSortDescriptor(key:"name", ascending: true)]//NSSortDescriptor指定结果以“name”排正序
        
        frv = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer!, sectionNameKeyPath: nil, cacheName: nil)//初始化NSFetchedResultsController
        frv.delegate = self //设置代理为本身控制器
        
        //3.让缓冲区执行数据库查询请求 executeFetchRequest
        do{
            //执行查询并将结果保存到数组中
            try frv.performFetch()
            restaurants = frv.fetchedObjects as! [Restaurant]
            //数据保存后不会自动刷新tableView，需要使用NSFetchedResultsControllerDelegate协议更新
        }catch{
            print(error)
        }
        
        //创建一个实例，参数为搜索结果的控制器;如果是nil，则显示搜索条所在的视图中、
        sv = UISearchController(searchResultsController: nil)
        //更新搜索结果的控制器为当前控制器
        sv.searchResultsUpdater = self
        //搜索时背景变暗
        sv.dimsBackgroundDuringPresentation = false
        //将列表的页眉试图设置为所搜条
        tableView.tableHeaderView = sv.searchBar
        //设置搜索框的占位符
        sv.searchBar.placeholder="输入餐馆名搜索..."
        //设置搜索框前景色
//        sv.searchBar.tintColor=UIColor.orangeColor()
        //设置搜索框背景色
//        sv.searchBar.barTintColor=UIColor.blackColor()
        //设置搜索框为透明样式
        sv.searchBar.searchBarStyle = .Minimal
    }
    
    //当数据库内容发生变化时，NSFetchedResultsControllerDelegate协议的以下方法会被调用
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        //当控制器开始处理内容时
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        //内容发生变更时
        switch type {//数据变更类型筛选
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Automatic)//使用自动动画效果插入数据
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)//使用自动动画效果删除数据
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)//使用自动动画效果更新数据
            }
        default:
            tableView.reloadData()//刷新数据
        }
        
        restaurants = controller.fetchedObjects as! [Restaurant]//数据已经发生变化，同步到数组
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
        //当控制器已经处理完内容变更时
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
        return sv.active ? sr.count : restaurants.count
//        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell

        let r = sv.active ? sr[indexPath.row] : restaurants[indexPath.row]
        
        cell.name.text = r.name
        cell.type.text = r.type
        cell.location.text = r.location
        cell.img.image = UIImage(data: r.image!)
        cell.img.layer.cornerRadius = cell.img.frame.size.width / 2 //图片圆角化，正方形内切圆半径为正方形边长一半
        cell.img.clipsToBounds = true//图片布局生效
       
        
        
        //修复“一炮双响”
//        if status[indexPath.row] == true {
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
//      cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        cell.favImg.image = UIImage(named: "heart")
        cell.favImg.hidden = r.isVisited.boolValue ? false : true

        return cell
    }

    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return false
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
    
    


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return !sv.active
    }
 

    
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
//            self.restaurants.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)//删除行，并有滑动效果
            let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
            
            let restaurantToDel = self.frv.objectAtIndexPath(indexPath) as! Restaurant // 获取待删除对象
            
            buffer?.deleteObject(restaurantToDel)
            
            do {
                try buffer?.save()
            }catch{
                print(error)
            }
        }
        return [shareAction,deleteAction]
//        let favAction = UITableViewRowAction(style: .Default, title: "收藏") { (action, indexPath) -> Void in
//             let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
//             cell.favImg.hidden = false
//             self.restaurants[indexPath.row].isVisited = true
//        }
        
//        favAction.backgroundColor = UIColor(red: 253/255, green: 165/255, blue: 66/255, alpha: 0.7)
//        return [shareAction,favAction]
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
            let destVC = segue.destinationViewController as! DetailTableViewController
            
            let position = tableView.indexPathForSelectedRow!.row
            destVC.restaurant = sv.active ? sr[position] : restaurants[position]
            
        }
        
    }
    
    //反向转场
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        
    }
 

}
