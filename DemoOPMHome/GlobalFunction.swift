//
//  GlobalFunction.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/9/2.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit


func showAlert(title:String, message:String, addButtonTitle:String, delegate: UIAlertViewDelegate){
    //            var addView:UIAlertController = UIAlertController(title: "", message: "请检查网络状态", preferredStyle:.Alert)
    //            let actionOK = UIAlertAction(title:"OK", style:.Default) { action in
    //                self.viewDidLoad()
    //            }
    //            addView.addAction(actionOK)
    //            dispatch_async(dispatch_get_main_queue()) {
    //                self.presentViewController(addView, animated: true, completion: nil)
    //            }
    let alertview:UIAlertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Cancel")
    if (addButtonTitle != ""){
        alertview.addButtonWithTitle(addButtonTitle)
        alertview.cancelButtonIndex = 0
    }
    alertview.delegate = delegate
    dispatch_async(dispatch_get_main_queue()) {
        
        alertview.show()
        
    }
    
}


func createLocalNotification(seconds:Int){
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    let notification = UILocalNotification()
    
    let timeIntervalSinceNow = Double(seconds)
    notification.fireDate = NSDate(timeIntervalSinceNow: timeIntervalSinceNow)
    
    notification.timeZone = NSTimeZone.systemTimeZone()
    notification.alertBody = "Time's up!"
    
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
}