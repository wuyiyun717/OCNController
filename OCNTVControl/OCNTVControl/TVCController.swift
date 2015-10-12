//
//  FirstViewController.swift
//  OCNTVControl
//
//  Created by Wu YiYun on 15/9/29.
//  Copyright © 2015年 OCN. All rights reserved.
//

import UIKit

var tvBox = yueshi()
var tvStatus = 0 //0 for channel & volume, 1 for move
var stbld = ""

class TVCController: UIViewController, QRCodeReaderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scan(sender:AnyObject) {
        let reader = QRCodeReaderViewController()
        reader.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        reader.delegate = self;
        
        reader.setCompletionWithBlock { (resultAsString:String!) -> Void in
            self.navigationController?.popViewControllerAnimated(true)
            let alert = UIAlertView(title: "", message: resultAsString, delegate: self, cancelButtonTitle: "OK")
            alert.show()
            //stbld = resultAsString
            //tvBox.bindStb(resultAsString)
            
        }
        self.navigationController?.pushViewController(reader, animated: true)
    }
    
    @IBAction func toPayTab(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBOutlet var ScanButton: UIButton!

}

