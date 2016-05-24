//
//  AddRestaurantViewController.swift
//  FoodPin
//
//  Created by King Luo on 4/13/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit
import CoreData

//与相册互动需要遵从：UIImagePickerControllerDelegate, UINavigationControllerDelegate
class AddRestaurantViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var restaurant:Restaurant?
    var isVisited = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rImage: UIImageView!
    @IBOutlet weak var rName: UITextField!
    @IBOutlet weak var rType: UITextField!
    @IBOutlet weak var rAddr: UITextField!
    @IBOutlet weak var rIsvisited: UILabel!
    
    @IBAction func saveButtonAction(sender: UIBarButtonItem) {
        //校验格字段是否为空
        let buffer = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        let restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: buffer!) as! Restaurant
  
        restaurant.name = rName.text!
        restaurant.type = rType.text!
        restaurant.location = rAddr.text!
        
        if let image = rImage.image {
            //存储为NSData类型的图片（png类型）
            restaurant.image = UIImagePNGRepresentation(image)
        }
        restaurant.isVisited = isVisited//NSNumber类型与数字和布尔类型自动转换
        
        do {
            try buffer?.save()
        }catch {
            print(error)
        }
        
        //保存到LeanCloud
        saveRecordToCloud(restaurant)
        
        performSegueWithIdentifier("unwindToHomeList", sender: sender)
    }
    
    @IBAction func isVisitedBtnTapped(sender: AnyObject) {
        if sender.tag == 8001{
            isVisited = true
            rIsvisited.text = "我来过了"
        }else{
            isVisited = false
            rIsvisited.text = "没来过"
        }
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
    
    
    func saveRecordToCloud(restaurant: Restaurant){
        //准备一条需要保存的数据，把Restaurant对象转换为一个AVObject
        let record = AVObject(className: "Restaurant")
        record["name"] = restaurant.name;
        record["type"] = restaurant.type;
        record["location"] = restaurant.location
        
        //图像尺寸重新调整，为减小上传文件的尺寸，宽度大于1024的图片进行压缩
        let originImg = UIImage(data: restaurant.image!)!
        let scalingFac = (originImg.size.width > 1024) ? (1024 / originImg.size.width) : 1.0
        let scaledImg = UIImage(data: restaurant.image!, scale: scalingFac)!
        //把图片转换为jpg格式，并用LeanCloud的File类型保存，对图像、视频等文件采用File类型
        let imgFile = AVFile.fileWithName("\(restaurant.name).jpg", data:UIImageJPEGRepresentation(scaledImg, 0.8))
        imgFile.saveInBackground()
        
        record["image"] = imgFile//把图像File关联到记录
        
        //后台保存并通知结果
        record.saveInBackgroundWithBlock { (_, e) -> Void in
            if let e = e {
                print(e.localizedDescription)
            }else{
                print("保存成功！")
            }
        }
     
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
