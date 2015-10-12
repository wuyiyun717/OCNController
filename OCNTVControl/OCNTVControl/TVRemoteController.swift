//
//  TVRemoteController.swift
//  OCNTVControl
//
//  Created by Wu YiYun on 15/9/30.
//  Copyright © 2015年 OCN. All rights reserved.
//

import UIKit

class TVRemoteController: UIViewController, UIScrollViewDelegate {
    
    var viewIn = false
    var width:CGFloat!
    var hight:CGFloat!
    var upPic = UIImageView(frame: CGRectMake(0.0, 0.0, 58.0, 33.0))
    var downPic = UIImageView(frame: CGRectMake(0.0, 0.0, 58.0, 33.0))
    var leftPic = UIImageView(frame: CGRectMake(0.0, 0.0, 33.0, 58.0))
    var rightPic = UIImageView(frame: CGRectMake(0.0, 0.0, 33.0, 58.0))
    var buttonUp:UIButton!
    var buttonDown:UIButton!
    var buttonLeft:UIButton!
    var buttonRight:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.addTarget(self, action: "changePage:", forControlEvents: UIControlEvents.ValueChanged)
        //let deviceID = UIDevice.currentDevice().identifierForVendor!.UUIDString
        //print("uuid:\(deviceID)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        scrollView.backgroundColor = UIColor.darkGrayColor()
        scrollView.delegate = self
        width = UIScreen.mainScreen().bounds.width
        hight = scrollView.bounds.size.height
        for (var i=1; i<3; i++) {
            //            var fileName:NSString = "."
            //            if i < 3{
            //                fileName = "\(i).png"
            //            }
            //var subView = UIImageView(image: UIImage(named: fileName as String))
            let subView = UIView()
            let newWidth = width * CGFloat(i - 1)
            subView.frame = CGRect(x: newWidth, y: 0, width: width, height: hight)
            if i == 1 {
                let conpadWidth = width > hight ? hight - 20 : width - 20
                let controlPad = UIImageView(frame: CGRectMake(0, 0, conpadWidth, conpadWidth))
                controlPad.image = UIImage(named: "遥控按钮.png")
                controlPad.center = subView.center
                subView.addSubview(controlPad)
                
                let buttonWidth = conpadWidth/3
                
//                let buttonUp = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonWidth))
                buttonUp = UIButton(frame: CGRectMake(0.0, 0.0, buttonWidth, buttonWidth))
                buttonUp.center.x = subView.center.x
                buttonUp.center.y = subView.center.y - conpadWidth/3
                buttonUp.addTarget(self, action: "buttonUp:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonUp)
                //var upPic = UIImageView(frame: CGRectMake(0, 0, 58, 33))
                upPic.center = buttonUp.center
                upPic.image = UIImage(named:"up.png")
                subView.addSubview(upPic)
                
                buttonDown = UIButton(frame: CGRectMake(0.0, 0.0, buttonWidth, buttonWidth))
                buttonDown.center.x = subView.center.x
                buttonDown.center.y = subView.center.y + conpadWidth/3
                buttonDown.addTarget(self, action: "buttonDown:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonDown)
                //let downPic = UIImageView(frame: CGRectMake(0, 0, 58, 33))
                downPic.center = buttonDown.center
                downPic.image = UIImage(named:"down.png")
                subView.addSubview(downPic)
                
                buttonLeft = UIButton(frame: CGRectMake(0.0, 0.0, buttonWidth, buttonWidth))
                buttonLeft.center.x = subView.center.x - conpadWidth/3
                buttonLeft.center.y = subView.center.y
                buttonLeft.addTarget(self, action: "buttonLeft:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonLeft)
                //let leftPic = UIImageView(frame: CGRectMake(0, 0, 33, 58))
                leftPic.center = buttonLeft.center
                leftPic.image = UIImage(named:"left.png")
                subView.addSubview(leftPic)
                
                buttonRight = UIButton(frame: CGRectMake(0.0, 0.0, buttonWidth, buttonWidth))
                buttonRight.center.x = subView.center.x + conpadWidth/3
                buttonRight.center.y = subView.center.y
                buttonRight.addTarget(self, action: "buttonRight:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonRight)
                //let rightPic = UIImageView(frame: CGRectMake(0, 0, 33, 58))
                rightPic.center = buttonRight.center
                rightPic.image = UIImage(named:"right.png")
                subView.addSubview(rightPic)
                
                let buttonOK = UIButton(frame: CGRectMake(0.0, 0.0, buttonWidth, buttonWidth))
                buttonOK.center = subView.center
                buttonOK.setTitle("OK", forState: .Normal)
                buttonOK.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                buttonOK.addTarget(self, action: "buttonOK:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonOK)
                
                subView.backgroundColor = UIColor.darkGrayColor()
                //buttonUp.backgroundColor = UIColor.clearColor()
                

            }
            else{
                let numButtonWidth:CGFloat = hight/4 - 5
                let buttonNumOne = UIButton(frame: CGRectMake(30.0, 5.0, numButtonWidth, numButtonWidth))
                buttonNumOne.setImage(UIImage(named: "one.png"), forState: .Normal)
                buttonNumOne.addTarget(self, action: "buttonOne:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumOne)
                
                let buttonNumFour = UIButton(frame: CGRectMake(30.0, 10 + numButtonWidth, numButtonWidth, numButtonWidth))
                buttonNumFour.setImage(UIImage(named: "four.png"), forState: .Normal)
                buttonNumFour.addTarget(self, action: "buttonFour:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumFour)
                
                let buttonNumSeven = UIButton(frame: CGRectMake(30.0, 15.0 + numButtonWidth * 2, numButtonWidth, numButtonWidth))
                buttonNumSeven.setImage(UIImage(named: "seven.png"), forState: .Normal)
                buttonNumSeven.addTarget(self, action: "buttonSeven:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumSeven)
                
                let buttonSure = UIButton(frame: CGRectMake(30.0, 20.0 + numButtonWidth * 3, numButtonWidth, numButtonWidth))
                buttonSure.setImage(UIImage(named: "sure.png"), forState: .Normal)
                buttonSure.addTarget(self, action: "buttonSure:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonSure)
                
                let centerButtonX = width/2 - numButtonWidth/2
                let buttonNumTwo = UIButton(frame: CGRectMake(centerButtonX, 5.0, numButtonWidth, numButtonWidth))
                //buttonNumTwo.center.x = subView.center.x
                buttonNumTwo.setImage(UIImage(named: "two.png"), forState: .Normal)
                buttonNumTwo.addTarget(self, action: "buttonTwo:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumTwo)
                
                let buttonNumFive = UIButton(frame: CGRectMake(centerButtonX, 10.0 + numButtonWidth, numButtonWidth, numButtonWidth))
                //buttonNumFive.center.x = subView.center.x
                buttonNumFive.setImage(UIImage(named: "five.png"), forState: .Normal)
                buttonNumFive.addTarget(self, action: "buttonFive:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumFive)
                
                let buttonNumEight = UIButton(frame: CGRectMake(centerButtonX, 15.0 + numButtonWidth * 2, numButtonWidth, numButtonWidth))
                //buttonNumEight.center.x = subView.center.x
                buttonNumEight.setImage(UIImage(named: "eight.png"), forState: .Normal)
                buttonNumEight.addTarget(self, action: "buttonEight:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumEight)
                
                let buttonNumZero = UIButton(frame: CGRectMake(centerButtonX, 20.0 + numButtonWidth * 3, numButtonWidth, numButtonWidth))
                //buttonNumZero.center.x = subView.center.x
                buttonNumZero.setImage(UIImage(named: "zero.png"), forState: .Normal)
                buttonNumZero.addTarget(self, action: "buttonZero:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumZero)
                
                let rightButtonX = width - numButtonWidth - 30
                let buttonNumThree = UIButton(frame: CGRectMake(rightButtonX, 5.0, numButtonWidth, numButtonWidth))
                buttonNumThree.setImage(UIImage(named: "three.png"), forState: .Normal)
                buttonNumThree.addTarget(self, action: "buttonThree:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumThree)
                
                let buttonNumSix = UIButton(frame: CGRectMake(rightButtonX, 10.0 + numButtonWidth, numButtonWidth, numButtonWidth))
                buttonNumSix.setImage(UIImage(named: "six.png"), forState: .Normal)
                buttonNumSix.addTarget(self, action: "buttonSix:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumSix)
                
                let buttonNumNine = UIButton(frame: CGRectMake(rightButtonX, 15.0 + numButtonWidth * 2, numButtonWidth, numButtonWidth))
                buttonNumNine.setImage(UIImage(named: "nine.png"), forState: .Normal)
                buttonNumNine.addTarget(self, action: "buttonNine:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonNumNine)
                
                let buttonDelete = UIButton(frame: CGRectMake(rightButtonX, 20.0 + numButtonWidth * 3, numButtonWidth, numButtonWidth))
                buttonDelete.setImage(UIImage(named: "delete.png"), forState: .Normal)
                buttonDelete.addTarget(self, action: "buttonDelete:", forControlEvents: UIControlEvents.TouchUpInside)
                subView.addSubview(buttonDelete)

                
                subView.backgroundColor = UIColor.darkGrayColor()

            }

//            let subView = UIView()
//            let newWidth = width * CGFloat(i - 1)
//            subView.frame = CGRect(x: newWidth, y: 0, width: width, height: hight)
//            let button = UIButton(frame: CGRectMake(50 + newWidth, 50, 50, 50))
//            
//            if i == 1 {
//                subView.backgroundColor = UIColor.darkGrayColor()
//                button.backgroundColor = UIColor.blueColor()
//                button.addTarget(self, action: "buttonOne:", forControlEvents: UIControlEvents.TouchUpInside)
//                //scrollView.addSubview(button)
//                
//            }
//            else{
//                subView.backgroundColor = UIColor.orangeColor()
//                //let button = UIButton(frame: CGRectMake(50 + newWidth, 50, 50, 50))
//                button.backgroundColor = UIColor.greenColor()
//                button.addTarget(self, action: "buttonTwo:", forControlEvents: UIControlEvents.TouchUpInside)
//                
//            }
            scrollView.addSubview(subView)
            
            
        }
        scrollView.contentSize = CGSizeMake(width*2, hight)
        scrollView.bounces = false
        
        //滚动时是否水平显示滚动条
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        //分页显示
        scrollView.pagingEnabled = true
        
    }
    
    @IBAction func showArrow(sender: AnyObject){
        upPic.hidden = false
        downPic.hidden = false
        leftPic.hidden = false
        rightPic.hidden = false
        buttonUp.setTitle("", forState: UIControlState.Normal)
        buttonDown.setTitle("", forState: UIControlState.Normal)
        buttonLeft.setTitle("", forState: UIControlState.Normal)
        buttonRight.setTitle("", forState: UIControlState.Normal)
}
    
    @IBAction func showWords(sender: AnyObject){
        upPic.hidden = true
        downPic.hidden = true
        leftPic.hidden = true
        rightPic.hidden = true
        buttonUp.setTitle("音量+", forState: UIControlState.Normal)
        buttonDown.setTitle("音量-", forState: UIControlState.Normal)
        buttonLeft.setTitle("频道-", forState: UIControlState.Normal)
        buttonRight.setTitle("频道+", forState: UIControlState.Normal)
        buttonUp.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonDown.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonLeft.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        buttonRight.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }
    
    func buttonUp(sender: AnyObject?){
//        if tvStatus == 0 {
//            tvBox.sendAction(stbld, action: "action", value: "vup")
//        }
//        else if tvStatus == 1 {
//            tvBox.sendAction(stbld, action: "action", value: "up")
//        }
        //tvBox.sendAction(stbld, action: "action", value: "up")
        
        print("Up")
    }
    
    func buttonDown(sender: AnyObject?){
//        if tvStatus == 0 {
//            tvBox.sendAction(stbld, action: "action", value: "vdown")
//        }
//        else if tvStatus == 1 {
//            tvBox.sendAction(stbld, action: "action", value: "down")
//        }
        //tvBox.sendAction(stbld, action: "action", value: "up")
        print("Down")
    }
    
    func buttonLeft(sender: AnyObject?){
//        if tvStatus == 0 {
//            tvBox.sendAction(stbld, action: "switch", value: "")
//        }
//        else if tvStatus == 1 {
//            tvBox.sendAction(stbld, action: "action", value: "left")
//        }
        //tvBox.sendAction(stbld, action: "action", value: "up")
        print("Left")
    }
    
    func buttonRight(sender: AnyObject?){
//        if tvStatus == 0 {
//            tvBox.sendAction(stbld, action: "switch", value: "")
//        }
//        else if tvStatus == 1 {
//            tvBox.sendAction(stbld, action: "action", value: "right")
//        }
        print("Right")
    }
    
    func buttonOK(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "ok")
        print("OK")
    }
    
    func buttonOne(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "1")
        print("1")
    }
    
    func buttonTwo(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "2")
        print("2")
    }
    
    func buttonThree(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "3")
        print("3")
    }
    
    func buttonFour(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "4")
        print("4")
    }
    
    func buttonFive(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "5")
        print("5")
    }
    
    func buttonSix(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "6")
        print("6")
    }
    
    func buttonSeven(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "7")
        print("7")
    }
    
    func buttonEight(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "8")
        print("8")
    }
    
    func buttonNine(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "9")
        print("9")
    }
    
    func buttonZero(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "0")
        print("0")
    }
    
    func buttonSure(sender: AnyObject?){
        //tvBox.sendAction(stbld, action: "action", value: "ok")
        print("Sure")
    }
    
    func buttonDelete(sender: AnyObject?){
        print("Delete")
    }
    
    @IBAction func closeBox(sender: AnyObject) {
        //tvBox.sendAction(stbld, action: "action", value: "quit")
        print("Quit")
    }
    
    @IBAction func mute(sender: AnyObject) {
        //tvBox.sendAction(stbld, action: "action", value: "mute")
        print("Mute")
    }
    
    @IBAction func scanChannel(sender: AnyObject) {
        print("ScanChannel")
    }
    
    @IBAction func like(sender: AnyObject) {
        print("Like")
    }
    
    func changePage(sender:AnyObject){
        //var newWidth = width * ((pageControl.currentPage * 1.0) as CGFloat)
        if pageControl.currentPage == 0 {
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        }
        else{
            scrollView.setContentOffset(CGPoint(x: width, y: 0.0), animated: true)
        }
        //scrollView.setContentOffset(CGPoint(x: newWidth, y: 0.0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView:UIScrollView) {
        let index = scrollView.contentOffset.x/width
        //pageControl(setCurrentPage:index)
        pageControl.currentPage = Int(index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!

}