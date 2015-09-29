//
//  AppDelegate.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/12.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreTelephony

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var atBackground = false
    let callCenter:CTCallCenter! = CTCallCenter()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        var MPView = MPVolumeView(frame: CGRectMake(0, -100, 100, 100))
//        var volumeSlider = UISlider()
//        for views in MPView.subviews{
//            if views.description.hasPrefix("<MPVolumeSlider") {
//                volumeSlider = views as! UISlider
//            }
//        }
//        volumeSlider.setValue(0.5, animated: true)
//        self.window?.addSubview(MPView)
        
        if(UIApplication.instancesRespondToSelector("registerUserNotificationSettings:")){
            let types:UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound, UIUserNotificationType.Badge]
            let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        callCenter.callEventHandler = {(call:CTCall) -> Void in
            if (call.callState == CTCallStateDialing){
                print("Dialling")
            }
            else if (call.callState == CTCallStateIncoming){
                print("Incoming")
            }
            else if (call.callState == CTCallStateConnected){
                print("Connected")
            }
            else if (call.callState == CTCallStateConnected){
                print("Disconnected")
            }
            else {
                print("Done")
            }
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        atBackground = true
       //let call = {NSSet(set: callCenter.currentCalls!)}
//        if (call) {
//        }
        print("Go to Background")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
    }
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        let url:NSURL! = NSURL(string: "")
        
        let request:NSURLRequest! = NSURLRequest(URL: url)
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error?.code)
                print(error?.description)
                completionHandler(UIBackgroundFetchResult.Failed)
            }
            else{
                let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(str)
                
                UIApplication.sharedApplication().cancelAllLocalNotifications()
                
                let localNotification = UILocalNotification()
                localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
                localNotification.timeZone = NSTimeZone.defaultTimeZone()
                localNotification.alertBody = "\(str)"
                localNotification.soundName = UILocalNotificationDefaultSoundName
                UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
                
                completionHandler(UIBackgroundFetchResult.NewData)
            }
        }) as NSURLSessionTask
        
        dataTask.resume()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
//        var MPView = MPVolumeView(frame: CGRectMake(0, -100, 100, 100))
//        var volumeSlider = UISlider()
//        for views in MPView.subviews{
//            if views.description.hasPrefix("<MPVolumeSlider") {
//                volumeSlider = views as! UISlider
//            }
//        }
//        volumeSlider.setValue(0.5, animated: true)
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if atBackground == true{
            print("Back")
        }
        atBackground = false
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

