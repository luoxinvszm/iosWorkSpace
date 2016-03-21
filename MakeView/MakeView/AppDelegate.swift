//
//  AppDelegate.swift
//  MakeView
//
//  Created by King Luo on 11/25/14.
//  Copyright (c) 2014 King Luo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //初始化window，设置其大小为整个屏幕大小
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //设置背景颜色为红色
        self.window?.backgroundColor = UIColor.redColor()
        //使window可见
        self.window?.makeKeyAndVisible()
        
        //初始化rootView并设置位置，大小
        var rootView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        //设置rootView背景颜色
        rootView.backgroundColor = UIColor.whiteColor()
        //把rootView附加到window上
        self.window?.addSubview(rootView)
        
        //初始化label1并设置位置，大小
        var label1 = UILabel(frame: CGRect(x: 100, y: 20, width: 100, height: 50))
        //色织label1的tag，以根据tag查找该控件
        label1.tag = 2
        //设置label1文本值
        label1.text = "Hello"
        //设置label1文本颜色
        label1.textColor = UIColor.blackColor()
        //附加label1到rootView
        rootView.addSubview(label1)
        
        //初始化button1并设置位置，大小
        var button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        //设置button1显示文本和控制状态
        button1.setTitle("Click Me", forState: UIControlState.Normal)
        //设置button1背景颜色为灰色
        button1.backgroundColor = UIColor.brownColor()
        //为button1添加事件
        button1.addTarget(self, action: "button1Click:", forControlEvents: UIControlEvents.TouchUpInside)
        rootView.addSubview(button1)
        return true
    }
    
    @IBAction
    func button1Click(sender: UIButton){
        //根据tag获得控件
        var label1 = self.window?.viewWithTag(2) as UILabel
        label1.text = "感谢点击"
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

