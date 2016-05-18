//
//  GuiderPageViewController.swift
//  FoodPin
//
//  Created by King Luo on 5/17/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import UIKit

//遵从UIPageViewControllerDataSource协议
class GuiderPageViewController: UIPageViewController,UIPageViewControllerDataSource  {

    var headings = ["私人订制","餐馆定位","美食发现"]
    var images = ["foodpin-intro-1","foodpin-intro-2","foodpin-intro-3"]
    var footers = ["好店随时加，打造自己的美食向导","马上找到饕餮大餐之馆的位置","发现其他吃货的珍藏"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self //设置数据源为自身
        
        if let startVC = viewControllerAtIndex(0){//创建第一个页面
            setViewControllers([startVC], direction: .Forward, animated: true, completion: nil)
        }
        
    }
    
    //上一个控制器
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        
        index += 1
        
        return viewControllerAtIndex(index)
    }
    
    //下一个控制器
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> GuideContentViewController? {
        
        if case 0 ..< headings.count = index {//判断index是否在合理区间0~2
            //创建一个新视图控制器并传递数据
            if let contentVC = storyboard?.instantiateViewControllerWithIdentifier("GuideContentController") as? GuideContentViewController {
                contentVC.heading = headings[index]
                contentVC.footer = footers[index]
                contentVC.imageName = images[index]
                contentVC.index = index
                
                return contentVC
            }
        }
        
        return nil
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //要显示的页数,不提供更改索引颜色选项
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return headings.count
//    }
    
    //起始页的索引,不提供更改索引颜色选项
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
