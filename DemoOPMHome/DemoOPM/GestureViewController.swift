//
//  GestureViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/9/15.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    var oriVal = arc4random_uniform(5).hashValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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