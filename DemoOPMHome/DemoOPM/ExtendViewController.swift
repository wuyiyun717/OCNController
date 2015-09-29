//
//  ExtendViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/14.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ExtendViewController: UIViewController, UIScrollViewDelegate{
    
    var viewIn = false
    var mainScorllView =  CycleScrollView()
    var width:CGFloat!
    var hight:CGFloat!
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(global, terminator: "")
        global = "hello4"
        print(global, terminator: "")
        //pageControl.enabled = false
        pageControl.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.ValueChanged)
        timer = NSTimer(timeInterval: 3, target: self, selector: "changePageByTime:", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        let audioSession = AVAudioSession.sharedInstance()
        let volume = audioSession.outputVolume
        print("volume\(volume)", terminator: "")
//        let MPView = MPVolumeView.new()
//        var volumeSlider = UISlider()
//        
//        for views in MPView.subviews{
//            if views.description.hasPrefix("<MPVolumeSlider") {
//                volumeSlider = views as! UISlider
//            }
//        }
//        let val = volumeSlider.value
//        
//        print("vol\(val)", terminator: "")
//        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "volumeChanged:", name: "AVSystemController_SystemVolumeDidChangeNotification", object: nil)
        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
        //self.tabBarController?.tabBar.hidden = true
//        var viewsArray = NSMutableArray()
//
//        mainScorllView = CycleScrollView(frame: CGRectMake(0, 20, 320, 103), animationDuration: 4)
//        mainScorllView.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.1)
        //mainScorllView.fetchContentViewAtIndex = {(pageIndex:NSInteger) -> UIview in return (viewsArray[pageIndex] as! UIView)}
//        self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, 103) animationDuration:4];
//
//        self.mainScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
//        
//        self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
//            return viewsArray[pageIndex];
//        };
//        self.mainScorllView.totalPagesCount = ^NSInteger(void){
//            return 2;
//        };
//        [self.view addSubview:self.mainScorllView];
//        var tapGesture = UITapGestureRecognizer(target: self, action: "hideView:")
//        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func volumeChanged(notification:NSNotification){
//        var volume = (notification.userInfo as! NSDictionary).objectForKey("AVSystemController_AudioVolumeNotificationParameter")?.floatValue
//        println(volume)
//    }
    func volumeChanged(notification:NSNotification){
        
//        let MPView = MPVolumeView.new()
//        
//        var volumeSlider = UISlider()
//        for views in MPView.subviews{
//            if views.description.hasPrefix("<MPVolumeSlider") {
//                volumeSlider = views as! UISlider
//            }
//        }
//        //volumeSlider.setValue(0.5, animated: true)
//        let outputvolume = volumeSlider.value
//        //        let audioSession = AVAudioSession.sharedInstance()
//        //        var outputvolume = audioSession.outputVolume
//        
//        //var volume = (notification.userInfo as? NSDictionary)
//        let volume = (notification.userInfo as! NSDictionary).objectForKey("AVSystemController_AudioVolumeNotificationParameter")?.floatValue
//        
//        let addView:UIAlertController = UIAlertController(title: "\(outputvolume)", message: "\(volume!)", preferredStyle:.Alert)
//        let actionOK = UIAlertAction(title:"OK", style:.Default) { action in
//        }
//        addView.addAction(actionOK)
//        dispatch_async(dispatch_get_main_queue()) {
//            self.presentViewController(addView, animated: true, completion: nil)
//        }
//        
//        //volumeSlider.setValue(volume!, animated: false)
//        MPVolumeSettingsAlertHide()
    }

    override func viewDidAppear(animated: Bool) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goback:")
        self.view.backgroundColor = UIColor.grayColor()
        self.view.addSubview(upperView)
        
        width = UIScreen.mainScreen().applicationFrame.width - 32
        print(width, terminator: "")
        hight = scrollView.bounds.size.height
        scrollView.delegate = self
        for (var i=1; i<3; i++) {
            var fileName:NSString = "."
            if i < 3{
                fileName = "\(i).png"
            }
            //var subView = UIImageView(image: UIImage(named: fileName as String))
            let subView = UIView()
            let newWidth = width * CGFloat(i - 1)
            subView.frame = CGRect(x: newWidth, y: 0, width: width, height: hight)
            let button = UIButton(frame: CGRectMake(50 + newWidth, 50, 50, 50))
            if i == 1 {
                subView.backgroundColor = UIColor.purpleColor()
                button.backgroundColor = UIColor.blueColor()
                button.addTarget(self, action: "buttonOne:", forControlEvents: UIControlEvents.TouchUpInside)

            }
            else{
                subView.backgroundColor = UIColor.orangeColor()
                button.backgroundColor = UIColor.greenColor()
                button.addTarget(self, action: "buttonTwo:", forControlEvents: UIControlEvents.TouchUpInside)

            }
            scrollView.addSubview(subView)
            
            scrollView.addSubview(button)

        }
        scrollView.contentSize = CGSizeMake(width*2, hight)
        scrollView.bounces = false
        
        //滚动时是否水平显示滚动条
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        //分页显示
        scrollView.pagingEnabled = true
    }
    
    func changePageByTime(sender:AnyObject){
        //var newWidth = width * ((pageControl.currentPage * 1.0) as CGFloat)
        if pageControl.currentPage == 1 {
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
            pageControl.currentPage = 0
        }
        else{
            scrollView.setContentOffset(CGPoint(x: width, y: 0.0), animated: true)
            pageControl.currentPage = 1
        }
        //scrollView.setContentOffset(CGPoint(x: newWidth, y: 0.0), animated: true)
    }

    
    func changePage(sender:AnyObject){
        //var newWidth = width * ((pageControl.currentPage * 1.0) as CGFloat)
        if pageControl.currentPage == 0 {
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        }
        else{
            scrollView.setContentOffset(CGPoint(x: width, y: 0.0), animated: true)
        }
        timer.resumeTimerAfterTimeInterval(3.0)
        //scrollView.setContentOffset(CGPoint(x: newWidth, y: 0.0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView:UIScrollView) {
        let index = scrollView.contentOffset.x/width
        //pageControl(setCurrentPage:index)
        pageControl.currentPage = Int(index)
        timer.resumeTimerAfterTimeInterval(3.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goback(sender:AnyObject?){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func moveToCenter(sender: AnyObject) {
        if viewIn {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            upperView.center.x = self.view.center.x + UIScreen.mainScreen().applicationFrame.width
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
            UIView.commitAnimations()
            viewIn = false
            timer.resumeTimerAfterTimeInterval(3.0)
            pageControl.enabled = true
        }
        else{
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            upperView.center.x = self.view.center.x
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
            UIView.commitAnimations()
            viewIn = true
            timer.pauseTimer()
            pageControl.enabled = false
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = (touches as NSSet).anyObject()?.locationInView(upperView)
        //println(touch!.indexOf(1))
        if(touch?.x > 0 && touch?.y > 0 && touch?.x < upperView.bounds.width && touch?.y < upperView.bounds.height){
            //println("In")
        }
        else{
            //println("Out")
            hideView()
        }
        self.resignFirstResponder()
    }
    
    func buttonOne(sender:AnyObject){
        label.text = "Button One Tapped"
    }
    
    func buttonTwo(sender:AnyObject){
        label.text = "Button Two Tapped"
    }
    
    func hideView(){
        if viewIn {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            upperView.center.x = self.view.center.x + UIScreen.mainScreen().applicationFrame.width
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
            UIView.commitAnimations()
            viewIn = false
            timer.resumeTimerAfterTimeInterval(3.0)
            pageControl.enabled = true
        }
    }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var upperView: UIView!
}