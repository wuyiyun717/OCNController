//
//  ViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/12.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

var global = "Hi"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(global, terminator: "")
        global = "hello"
        let deviceID = UIDevice.currentDevice().identifierForVendor
        print("uuid:\(deviceID)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

