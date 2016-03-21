//
//  ViewController.swift
//  BeautyGallery
//
//  Created by King Luo on 11/24/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let beauties = ["范冰冰", "李冰冰", "王菲", "杨幂", "周迅"]
    
    @IBOutlet weak var beautyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beautyPicker.dataSource = self
        beautyPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToGallery" {
            let index = beautyPicker.selectedRowInComponent(0)//获取第1列PickerView选中的项
            let vc = segue.destinationViewController as! GalleryViewController
            switch index {
            case 0:
                vc.imageName = "fanbingbing"
            case 1:
                vc.imageName = "libingbing"
            case 2:
                vc.imageName = "wangfei"
            case 3:
                vc.imageName = "yangmi"
            case 4:
                vc.imageName = "zhouxun"
            default:
                vc.imageName = nil
            }
        }
    }
    
    //Unwind Segue方式在 ViewController 之间传递，segue 为导航回来的 ViewController 的指针
    @IBAction func close(segue: UIStoryboardSegue){
        print("closed", terminator: "")
    }

}

