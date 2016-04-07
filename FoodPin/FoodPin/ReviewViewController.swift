//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by King Luo on 4/7/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    var rating:String?
    var imgName:String=""
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var btStackView: UIStackView!
    
    @IBAction func ratingTappedAction(sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        default:
            break
        }
        
        //反向转场
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //添加模糊效果
        let blurEffect = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        
        effectView.frame = view.frame
        bgImageView.image = UIImage(named: imgName)
        bgImageView.addSubview(effectView)
        
        //给stackView添加动画,加载时隐藏stackView
        let scale = CGAffineTransformMakeScale(0, 0)
        //给stackView添加升级动画
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        //组合两种动画效果
        btStackView.transform = CGAffineTransformConcat(scale, translate)
        
        
    }
    
    //给stackView添加动画,试图渲染成功后0.3秒内显示stackView
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4) { () -> Void in
            self.btStackView.transform = CGAffineTransformIdentity
        }
        
        //ios7后震荡效果动画
//        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
//                self.btStackView.transform = CGAffineTransformIdentity
//            }, completion: nil)
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
