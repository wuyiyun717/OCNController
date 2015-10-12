//
//  CollectionViewController.swift
//  DemoOPM
//
//  Created by Wu YiYun on 15/8/24.
//  Copyright (c) 2015年 wyy. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(global, terminator: "")
        global = "hello2"
        self.tabBarController?.tabBar.hidden = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.registerClass(HeaderViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        let deviceID = UIDevice.currentDevice().identifierForVendor
        print("uuid:\(deviceID)")
        //collectionView.registerClass(UICollectionReusableView.self, forCellWithReuseIdentifier: "headerView")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(100, 50)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        var reuseableView = UICollectionReusableView()
//        var headerView: UICollectionReusableView = self.collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", forIndexPath: indexPath) as! UICollectionReusableView
//        headerView.backgroundColor = UIColor.orangeColor()
//        reuseableView = headerView
//        return reuseableView
//        var reuseIdentifier = NSString()
//        if(kind == UICollectionElementKindSectionHeader){
//            reuseIdentifier = 
//        }
        var reuseableView = UICollectionReusableView(frame: CGRectMake(0, 0, 100, 50))
        reuseableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) 
        let label = UILabel(frame: CGRectMake(0, 0, 100, 50))
        label.text = "Header"
        reuseableView.addSubview(label)
        return reuseableView
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected", terminator: "")
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        //return UIEdgeInsetsMake(5, 5, 5, 5)
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (UIScreen.mainScreen().applicationFrame.width - 4) / 5
        return CGSizeMake(width, width)
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) 
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
}