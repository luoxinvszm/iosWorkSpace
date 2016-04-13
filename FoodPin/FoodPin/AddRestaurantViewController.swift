//
//  AddRestaurantViewController.swift
//  FoodPin
//
//  Created by King Luo on 4/13/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

//与相册互动需要遵从：UIImagePickerControllerDelegate, UINavigationControllerDelegate
class AddRestaurantViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rImage: UIImageView!
    @IBOutlet weak var rName: UITextField!
    @IBOutlet weak var rType: UITextField!
    @IBOutlet weak var rAddr: UITextField!
    
    @IBAction func saveButtonAction(sender: UIBarButtonItem) {
      
    }
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
    
    //当单元格被点击时触发
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {//判断是否点击第一个单元格
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){//访问相册的权限检测，如果有实例化一个相册选择控制器
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self //设置图片选择控制器的代理为当前试图
                imagePicker.allowsEditing = false //不允许对相册图片编辑
                imagePicker.sourceType = .PhotoLibrary//设置图片来源为相册
                
                self.presentViewController(imagePicker,animated: true, completion: nil)// 以模态方式弹出
                
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)//取消单元格选中状态
        }
    }
    
    //当用户从相册中选择了一张图片，以下方法被触发
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage //从媒体信息字典数据中查询“原始图像”字典
        imageView.contentMode = .ScaleToFill //设置图片填充模式为：平铺
        imageView.clipsToBounds = true //超出部分裁边
        
        let leftCons = NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: imageView.superview, attribute: .Leading, multiplier: 1, constant: 0)//设置imageView左边距
        
        let rightCons = NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: imageView.superview, attribute: .Trailing, multiplier: 1, constant: 0)//设置imageView右边距
        
        let topCons = NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: imageView.superview, attribute: .Top, multiplier: 1, constant: 0)//设置imageView上边距
        
        let bottomCons = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: imageView.superview, attribute: .Bottom, multiplier: 1, constant: 0)//设置imageView下边距
        
        //让每个约束生效
        leftCons.active = true
        rightCons.active = true
        topCons.active = true
        bottomCons.active = true
        
        dismissViewControllerAnimated(true, completion: nil)//相册视图退场
    }
    
    

    // MARK: - Table view data source
//    动态列表才需要
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
