//
//  GuideContentViewController.swift
//  FoodPin
//
//  Created by King Luo on 5/11/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class GuideContentViewController: UIViewController {
    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var labelFooter: UILabel!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    //点击时引导页退场，头两个引导页不显示按钮
    @IBAction func doneBtnTapped(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        //在standard文件中添加属性
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setBool(true, forKey: "GuiderShowed")
    }
    
    var index = 0
    var heading = ""
    var footer = ""
    var imageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageCtrl.currentPage = index
        
        labelHeading.text = heading
        labelFooter.text = footer
        imageView.image = UIImage(named: imageName)
        
        if index == 2 {
            doneBtn.hidden = false
            doneBtn.setTitle("马上体验", forState: .Normal)
        }else{
            doneBtn.hidden = true
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
