//
//  GestureViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/9/15.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController, UITabBarControllerDelegate {
    
    var oriVal = arc4random_uniform(5).hashValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceID = UIDevice.currentDevice().identifierForVendor
        print("uuid:\(deviceID)")

        let swipUp = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipUp)
        let swipDown = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipDown)
        let swipLeft = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipLeft)
        let swipRight = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipRight)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50))
        let backButton = UIBarButtonItem(title: "返回", style: .Done, target: self, action: "GoBack")
        let navigationItem = UINavigationItem()
        navigationItem.setLeftBarButtonItem(backButton, animated: true)
        navigationBar.setItems([navigationItem], animated: true)
        //self.view.addSubview(navigationBar)
//        let tabbar = UITabBar(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height - 50, UIScreen.mainScreen().bounds.width, 50))
//        self.view.addSubview(tabbar)
//        let selfPage = UITabBarItem(title: "Random", image: nil, tag: 0)
//        let anythingPage = UITabBarItem(title: "Anything", image: nil, tag: 0)
//        tabbar.items = [selfPage, anythingPage]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goback(){
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("GestureView")

        //let next = GestureViewController()
        //self.presentViewController(next, animated:true, completion: nil)
        self.popoverPresentationController

    }
    
    func swipe(recognizer:UISwipeGestureRecognizer){
        switch recognizer.direction{
        case UISwipeGestureRecognizerDirection.Up:
            print("向上滑动")
        case UISwipeGestureRecognizerDirection.Down:
            print("向下滑动")
        case UISwipeGestureRecognizerDirection.Left:
            print("向左滑动")
        case UISwipeGestureRecognizerDirection.Right:
            print("向右滑动")
        default:
            print("向未知方向滑动")
        }
    }
    
    @IBAction func randomSearch(sender: AnyObject?){
        print("Ori:(\(oriVal))")
        var newVal = arc4random_uniform(5).hashValue
        print("New:(\(newVal))")
        while(newVal == oriVal){
            newVal = arc4random_uniform(5).hashValue
            print("RecreateNew:(\(newVal))")
        }
        oriVal = newVal
        print("OriVal:(\(oriVal))")
    }

}