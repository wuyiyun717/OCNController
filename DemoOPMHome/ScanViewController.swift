//
//  ScanViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/9/23.
//  Copyright © 2015年 wyy. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController, QRCodeReaderDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceID = UIDevice.currentDevice().identifierForVendor
        print("uuid:\(deviceID)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanCard(sender: AnyObject) {
        let reader = QRCodeReaderViewController()
        //QRCodeReaderViewController *reader = [QRCodeReaderViewController new];\
        reader.modalPresentationStyle = UIModalPresentationStyle.FormSheet
        //reader.modalPresentationStyle = UIModalPresentationFormSheet
        reader.delegate = self;
        
        //__weak typeof (self) wSelf = self;
        reader.setCompletionWithBlock { (resultAsString:String!) -> Void in
            self.navigationController?.popViewControllerAnimated(true)
            let alert = UIAlertView(title: "", message: resultAsString, delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        //[reader setCompletionWithBlock:^(NSString *resultAsString) {
        //    [wSelf.navigationController popViewControllerAnimated:YES];
        //    [[[UIAlertView alloc] initWithTitle:@"" message:resultAsString delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil] show];
        //    }];
        
        //[self presentViewController:reader animated:YES completion:NULL];
        //self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(reader, animated: true)
        //[self.navigationController pushViewController:reader animated:YES];
        //let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        //cardIOVC.modalPresentationStyle = .FullScreen
        //presentViewController(cardIOVC, animated: true, completion: nil)
    }
    
//    @IBAction func toNext(sender: AnyObject) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("TabBarView")
//        //var next = EntendOneViewController()
//        //next.hidesBottomBarWhenPushed = true
//        self.navigationController?.navigationItem.backBarButtonItem?.title = "返回"
//        self.navigationController?.pushViewController(next, animated: true)
//
//    }
    
//    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
//        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
//        if let info = cardInfo {
//            //let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
//            resultLabel.text = info.redactedCardNumber
//        }
//        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
//    }  
    
    @IBOutlet var resultLabel:UILabel!
}
