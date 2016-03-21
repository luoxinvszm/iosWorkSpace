//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by King Luo on 11/24/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit
import Social //导入 SocialFramework ，该框架为Apple整合社交网站分享功能

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var beautyImage: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = imageName {
            beautyImage.image = UIImage(named: name)
            
            switch name {
            case "fanbingbing":
                navigationItem.title = "范冰冰"
            case "libingbing":
                navigationItem.title = "李冰冰"
            case "wangfei":
                navigationItem.title = "王菲"
            case "yangmi":
                navigationItem.title = "杨幂"
            case "zhouxun":
                navigationItem.title = "周迅"
            default:
                navigationItem.title = "女生画廊"
            }
        }
        
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        print("share Tapped", terminator: "")
        //分享功能的服务商
         let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        //设置分享的初始文字
        controller.setInitialText("一起来玩女神画廊App，Github上的源码在 https://github.com/JakeLin/BeautyGallery")
        //添加分享的图片
        controller.addImage(beautyImage.image)
        //设置分享控制器（控制器，是否动画，返回的动作）
        self.presentViewController(controller, animated: true, completion: nil)
    }
}
