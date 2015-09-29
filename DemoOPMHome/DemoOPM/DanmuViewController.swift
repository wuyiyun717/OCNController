//
//  DanmuViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/26.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit
//import CryptoSwift
import MapKit
import CoreLocation

var danmuTimer = NSTimer()


class DanmuViewController: UIViewController, UIAlertViewDelegate, CLLocationManagerDelegate{
    var danmuY:CGFloat = 50.0
    //var timer = NSTimer()
    //var danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, 50, UIScreen.mainScreen().applicationFrame.width, 50))
    //var originX = UIScreen.mainScreen().applicationFrame.width + UIScreen.mainScreen().applicationFrame.width / 2
    var originX:CGFloat = 0.0
    var danmu = UILabel()
    var mainMapView:MKMapView!
    let locationManager:CLLocationManager = CLLocationManager()
    var oriVolValue:Double = 0.0
    var oriChanValue:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originX = self.view.center.x + UIScreen.mainScreen().applicationFrame.width
        danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, 50, UIScreen.mainScreen().applicationFrame.width, 50))
        danmu.text = "我是弹幕......"
        self.view.addSubview(danmu)
        
        /*弹幕*/
        //danmu.backgroundColor = UIColor.yellowColor()
        //danmuTimer = NSTimer(timeInterval: 5, target: self, selector: "danmuShow", userInfo: nil, repeats: true)
        //NSRunLoop.currentRunLoop().addTimer(danmuTimer, forMode: NSRunLoopCommonModes)
        /*弹幕*/

        
//        var data:NSData = NSData(bytes: [49, 50, 51] as [UInt8], length: 3)
//        if let data = CryptoSwift.Hash.md5(data).calculate(){
//            println(data)
//        }
        
        /*加密*/
//        var key = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00] as [UInt8]
//        var iv = Cipher.randomIV(AES.blockSize)
//        //let setup = (key: keyData, iv: ivData)
//        var message = "abc"
//        var str = [UInt8](message.utf8)
//        print(str)
        //let encryptedAES = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC)?.encrypt(message, padding: PKCS7())
//        let encrypted = AES(key: key, iv: iv, blockMode:CipherBlockMode.CBC)?.encrypt(str, padding: PKCS7())
//        
//        let a = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC)
//        let result = a?.encrypt(str, padding: PKCS7())
//        print(result!)
//        let decrypted = a!.decrypt(result!, padding: PKCS7())
//        print(decrypted!)
//        print(message.md5())
        /*加密*/

        /*旋转*/
        volumeStepper.stepValue = 1.0
        channelStepper.stepValue = 1.0
        oriVolValue = volumeStepper.value
        oriChanValue = channelStepper.value
        
        print("初始音量:\(volumeStepper.value)", terminator: "")
        print("初始频道:\(channelStepper.value)", terminator: "")
        //dispatch_async(dispatch_get_main_queue()) {
            //self.volumeStepper.frame = CGRectMake(50, 100, 100, 30)
            //self.view.addSubview(self.volumeStepper)
        //}
        print("旋转前:\(volumeStepper.frame)", terminator: "")
        let oriX = volumeStepper.frame.origin.x
        let oriY = volumeStepper.frame.origin.y
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(3.0)
//        volumeStepper.transform = CGAffineTransformRotate(volumeStepper.transform, CGFloat(M_PI_2))
//        UIView.commitAnimations()
//        print("旋转后:\(volumeStepper.frame)", terminator: "")
        view.transform = CGAffineTransformIdentity
        let deltaX = oriX - volumeStepper.frame.origin.x
        let deltaY = oriY - volumeStepper.frame.origin.y
//        volumeStepper.transform = CGAffineTransformTranslate(volumeStepper.transform, deltaX, deltaY)
        /*旋转*/

        //dispatch_async(dispatch_get_main_queue()) {
        //    self.volumeStepper.frame.origin = CGPointMake(80, 184)
        //}
        //volumeStepper.frame.origin = CGPointMake(80, 184)
        //println("平移后:\(volumeStepper.frame)")

        //volumeStepper.addTarget(self, action: "volumeChanged:", forControlEvents: )
        //reverseGeocode()
        //locationEncode()
        createLocalNotification(10)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func danmuShow(){
        danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, danmuY, UIScreen.mainScreen().applicationFrame.width, 50))
        if((danmuY/50) % 2 == 1){
            danmu.text = "我是弹幕......"
        }
        else{
            danmu.text = "我又来了......"
        }
        self.view.addSubview(danmu)

        //println("From:\(danmu.center.x)")
        //println("Danmu Show")
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(4.5)
        danmu.center.x = 0 - UIScreen.mainScreen().applicationFrame.width / 2
        //println(danmu.center.x)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        UIView.commitAnimations()
//        dispatch_async(dispatch_get_main_queue()) {
//            self.danmu.center.x = self.originX
//        }
        danmuY += 50
        //danmu.center.x = originX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func stop(sender: AnyObject) {
        danmuTimer.pauseTimer()
        showAlert("Reset", message: "Reset", addButtonTitle: "OK", delegate: self)
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == alertView.cancelButtonIndex){
            print("Cancel tapped.", terminator: "")
        }
        else{
            print("OK tapped.", terminator: "")
            danmuY = 50.0
        }
        danmuTimer.resumeTimer()
    }
    
    /*地图*/
//    func reverseGeocode(){
//        var geocoder = CLGeocoder()
//        var p:CLPlacemark?
//        var currentLocation = CLLocation(latitude: 31.229171, longitude: 121.488231)
//        geocoder.reverseGeocodeLocation(currentLocation) { (placemarks:[AnyObject]!, error:NSError!) -> Void in
//            var array = NSArray(objects: "zh-hans")
//            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "AppleLanguages")
//            if error != nil {
//                return
//            }
//            let pm = placemarks as! [CLPlacemark]
//
//            if pm.count > 0 {
//                //p = (placemarks[0] as? CLPlacemark)!
//                p = placemarks[0] as? CLPlacemark
//                //println(p)
//                print("Location:\(p!.name)", terminator: "")
//            }
//        }
//    }
//    
//    func locationEncode(){
//        var geocoder = CLGeocoder()
//        var p:CLPlacemark!
//        geocoder.geocodeAddressString("上海市闸北区彭浦新村", { (placemarks:[AnyObject]!, error:NSError) -> Void in
//            let pm = placemarks as! [CLPlacemark]
//            
//            if pm.count > 0 {
//                //p = (placemarks[0] as? CLPlacemark)!
//                p = placemarks[0] as? CLPlacemark
//                //println(p)
//                print("经度:\(p.location!.coordinate.longitude)\n纬度：\(p.location!.coordinate.latitude)")
//            }
//        })
//        geocoder.geocodeAddressString("上海市闸北区彭浦新村", completionHandler: { (placemarks:[AnyObject]!, error:NSError!) -> Void in
//            let pm = placemarks as! [CLPlacemark]
//            
//            if pm.count > 0 {
//                //p = (placemarks[0] as? CLPlacemark)!
//                p = placemarks[0] as? CLPlacemark
//                //println(p)
//                print("经度:\(p.location!.coordinate.longitude)\n纬度：\(p.location.coordinate.latitude)")
//            }
//        })
//    }
//    
//    @IBAction func showMap(sender: AnyObject) {
//        mainMapView = MKMapView(frame: self.view.frame)
//        self.view.addSubview(mainMapView)
//        
//        mainMapView.mapType = MKMapType.Standard
//        
//        let latDelta = 0.05
//        let longDelta = 0.05
//        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        
//        let center:CLLocation = CLLocation(latitude: 31.22, longitude: 121.48)
//        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
//        
//        mainMapView.setRegion(currentRegion, animated: true)
//        
//        let objectAnnotation = MKPointAnnotation()
//        objectAnnotation.coordinate = CLLocation(latitude: 31.22, longitude: 121.48).coordinate
//        objectAnnotation.title = "上海"
//        objectAnnotation.subtitle = "shanghai"
//        
//        mainMapView.addAnnotation(objectAnnotation)
//    }
    /*地图*/
    
    @IBAction func volumeChanged(sender: AnyObject) {
        if volumeStepper.value > oriVolValue {
            print("音量增大:\(volumeStepper.value)", terminator: "")
        }
        else{
            print("音量减小:\(volumeStepper.value)", terminator: "")
        }
        oriVolValue = volumeStepper.value
    }
    
    @IBAction func channelChanged(sender: AnyObject) {
        if oriChanValue == 0 && channelStepper.value == 1000 {
            print("频道-:\(channelStepper.value)", terminator: "")
        }
        else if oriChanValue == 1000 && channelStepper.value == 0{
            print("频道+:\(channelStepper.value)", terminator: "")
        }
        else if channelStepper.value > oriChanValue {
            print("频道+:\(channelStepper.value)", terminator: "")
        }
        else{
            print("频道-:\(channelStepper.value)", terminator: "")
        }
        oriChanValue = channelStepper.value

    }
    
    @IBAction func toGesture(sender: AnyObject?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("GestureView") 
        //var next = EntendOneViewController()
        self.navigationController?.navigationItem.backBarButtonItem?.title = "返回"
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
    @IBOutlet var volumeStepper: UIStepper!
    @IBOutlet var channelStepper: UIStepper!
    @IBOutlet var label: UILabel!
    
}