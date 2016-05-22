//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by King Luo on 5/21/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit
import SafariServices //导入SafariServices，使用SafariController打开网页

class AboutTableViewController: UITableViewController {

    var sectionTitle = ["评分和反馈","关注我们"]
    var sectionContent = [["在App Store上给我们评分","反馈意见"],["网站","微信","花川学院"]]
    var links = ["http://www.huachuanxueyuan.com/user/1","http://www.huanchuanxueyuan.com/files/system/block_picture_1453917794.jpg","http://hcxy.me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: CGRectZero)//去除列表对于空行
        
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
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 2 : 3
    }
    
    //设置区块标题
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {//判断区块
        case 0:
            if indexPath.row == 0 {//第一个区块的第一行
                if let url = NSURL(string: "http://apple.com/itunes/charts/paid-apps/"){
                    UIApplication.sharedApplication().openURL(url)
                }
            }else {
                performSegueWithIdentifier("toWebView", sender: self)
            }
        case 1:
            if let url = NSURL(string: links[indexPath.row]){
                let sfvc = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                
                presentViewController(sfvc, animated: true, completion: nil)
            }
        default:
            break
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)//取消选中
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
