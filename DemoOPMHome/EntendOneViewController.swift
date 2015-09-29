//
//  EntendOneViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/14.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

class EntendOneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(global, terminator: "")
        global = "hello3"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goback:")
        self.view.backgroundColor = UIColor.grayColor()
        self.tabBarController?.tabBar.hidden = false

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goback(sender:AnyObject?){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func toNext(sender:AnyObject?){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ExtendView") 
        //var next = EntendOneViewController()
        //self.navigationController?.navigationBar.backItem?.title = "返回"
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
        
    }
}
