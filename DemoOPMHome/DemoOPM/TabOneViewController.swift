//
//  TabOneViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/14.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

class TabOneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(global, terminator: "")
        global = "hello2"
        self.tabBarController?.tabBar.hidden = false
        let deviceID = UIDevice.currentDevice().identifierForVendor
        print("uuid:\(deviceID)")

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toNext(sender: AnyObject?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("NextView") 
        //var next = EntendOneViewController()
        self.navigationController?.navigationItem.backBarButtonItem?.title = "返回"
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
}
