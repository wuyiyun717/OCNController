//
//  TabViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/10/8.
//  Copyright © 2015年 wyy. All rights reserved.
//

import UIKit

var selectedFirstTab = 0

class TabViewController:UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("original:\(selectedFirstTab)")
        self.selectedIndex = selectedFirstTab
        //tabbar.tintColor = UIColor.greenColor()
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        //print("before:\(selectedFirstTab)")
        selectedFirstTab = item.tag - 1
        //print("after:\(selectedFirstTab)")
        //print(item.tag)
    }
    
    @IBOutlet var tabbar: UITabBar!
}
