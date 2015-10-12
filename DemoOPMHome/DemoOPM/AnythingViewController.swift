//
//  AnythingController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/10/8.
//  Copyright © 2015年 wyy. All rights reserved.
//

import UIKit

class AnythingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("FirstTab")
        //var next = EntendOneViewController()
        //next.hidesBottomBarWhenPushed = true
        self.presentViewController(next, animated: true, completion:nil)

    }
}