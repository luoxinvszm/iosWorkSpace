//
//  DiscoverTableViewController.swift
//  FoodPin
//
//  Created by King Luo on 5/24/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UITableViewController {

    //更直接的方法是，在storyboard上直接添加。
    //使用Xcode 7的新特性：Extra View（额外视图）
    //打开discover.storyboard，从组件库拖一个进度指示器到view的Exit按钮左边
    //额外视图 适用于如果你想让一个子视图跟随一个主视图出现，但又不想让其初始化时成主视图层次结构的一部分的场合。
    //额外视图 位于主视图上方，
    //一个单独的小编辑器中。
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var restaurants: [AVObject] = []
    
    func getNewData() {
        getRecordFromCloud(true)
    }
    
    func getRecordFromCloud(needNew: Bool = false){
        let query = AVQuery(className: "Restaurant")
        
        if needNew {
            query.cachePolicy = .IgnoreCache
        }else {
            //我们选择缓存策略：
            //1. 缓存优先、如果无缓存则从网络查询
            //2.缓存有效期：2分钟
            query.cachePolicy = .CacheElseNetwork
            query.maxCacheAge = 60 * 2
            query.orderByAscending("createAt")
        }

        if query.hasCachedResult() {
            print("从缓存中获取结果！")
        }
        
        query.findObjectsInBackgroundWithBlock { (objects, e) -> Void in
            if let e = e {
                print(e.localizedDescription)
            }else if let objects = objects as? [AVObject]{
                self.restaurants = objects
                //操作系统为了充分利用CPU资源，通常把不同任务分配到优先级不等的“时间片段”中并行执行；即“线程
                //iOS中UI的变化是在高优先级的“主线程”中。而网络等耗时操作操作通常放在次要线程。LeanCloud的数据取回默认是在后台线程中
                //对策：当从网络取回数据时，把对UI的更新操作放回“主线程
                NSOperationQueue.mainQueue().addOperationWithBlock{//用于获取主线程，并加入要执行的任务。
                    self.tableView.reloadData()
                    //在获取数据完毕后，停止转圈动画
                    self.spinner.stopAnimating()
                    self.refreshControl?.endRefreshing()//解决下拉刷新，刷新控件没有自动隐藏
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        
        //下拉刷新.因为下拉刷新一定希望是最新的数据，不希望有缓存
        refreshControl = UIRefreshControl()//实例化一个UIRefreshControl给列表控制器的refreshControl属性，设置前景和背景色
        refreshControl?.backgroundColor = UIColor.whiteColor()
        refreshControl?.tintColor = UIColor.grayColor()
        refreshControl?.addTarget(self, action: #selector(DiscoverTableViewController.getNewData), forControlEvents: .ValueChanged)//当列表下拉到足够宽度时，触发ValueChanged事件。action为此时要执行的方法名
 
        //UIActivityIndicatorView可以用来显示一个转圈菊花
//        let spinner = UIActivityIndicatorView()
//        spinner.activityIndicatorViewStyle = .Gray
//        spinner.center = view.center
//        spinner.hidesWhenStopped = true
//        view.addSubview(spinner)
//        spinner.startAnimating()
        
        getRecordFromCloud()
        
        //数据加载结束时调用
//        spinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dCell", forIndexPath: indexPath)
        //AVObject实质是字典类型，查询key对应的值用可以直接用下标或objectForKey方法
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant["name"] as? String
        
        cell.imageView?.image = UIImage(named: "photoalbum")//1.设置单元格的默认图像为本地图像（photoalbum）实现瞬时加载
        //后台下载图像
        if let img = restaurant["image"] as? AVFile{
//            cell.imageView?.image = UIImage(data: img.getData())
            img.getDataInBackgroundWithBlock({ (data, e) -> Void in//2.后台获取图像getData的异步版本
                if let e = e {
                    print(e.localizedDescription)
                    return
                }
                //3.在主线程中更新图像
                NSOperationQueue.mainQueue().addOperationWithBlock{
                    cell.imageView?.image = UIImage(data: data)
                }
            })
        }
        
        return cell
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
