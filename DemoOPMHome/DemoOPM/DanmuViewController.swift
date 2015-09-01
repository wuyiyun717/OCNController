//
//  DanmuViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/26.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit
import CryptoSwift

class DanmuViewController: UIViewController {
    
    var timer = NSTimer()
    //var danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, 50, UIScreen.mainScreen().applicationFrame.width, 50))
    //var originX = UIScreen.mainScreen().applicationFrame.width + UIScreen.mainScreen().applicationFrame.width / 2
    var originX:CGFloat = 0
    var danmu = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        originX = self.view.center.x + UIScreen.mainScreen().applicationFrame.width
        danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, 50, UIScreen.mainScreen().applicationFrame.width, 50))
        danmu.text = "我是弹幕......"
        self.view.addSubview(danmu)
        //danmu.backgroundColor = UIColor.yellowColor()
        timer = NSTimer(timeInterval: 5, target: self, selector: "danmuShow", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
//        var data:NSData = NSData(bytes: [49, 50, 51] as [UInt8], length: 3)
//        if let data = CryptoSwift.Hash.md5(data).calculate(){
//            println(data)
//        }
        var key = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00] as [UInt8]
        var iv = Cipher.randomIV(AES.blockSize)
        //let setup = (key: keyData, iv: ivData)
        var message = "abc"
        var str = [UInt8](message.utf8)
        println(str)
        //let encryptedAES = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC).encrypt(message, padding:PKCS7())
        //let encrypted = AES(key: key, iv: iv, blockMode:CipherBlockMode.CBC)?.encrypt(str, padding: PKCS7())
        let a = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC)
        let result = a?.encrypt(str, padding: PKCS7())
        println(result!)
        let decrypted = a!.decrypt(result!, padding: PKCS7())
        println(decrypted!)
        println(message.md5())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func danmuShow(){
        danmu = UILabel(frame: CGRectMake(UIScreen.mainScreen().applicationFrame.width, 50, UIScreen.mainScreen().applicationFrame.width, 50))
        danmu.text = "我是弹幕......"
        self.view.addSubview(danmu)

        println("From:\(danmu.center.x)")
        println("Danmu Show")
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(4.5)
        danmu.center.x = 0 - UIScreen.mainScreen().applicationFrame.width / 2
        println(danmu.center.x)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        UIView.commitAnimations()
//        dispatch_async(dispatch_get_main_queue()) {
//            self.danmu.center.x = self.originX
//        }

        //danmu.center.x = originX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var label: UILabel!
    
}