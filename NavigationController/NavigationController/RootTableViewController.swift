//
//  RootTableViewController.swift
//  NavigationController
//
//  Created by admin on 16/6/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    private var dataSource: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //获取数据
        dataSource = NSArray(contentsOfURL: NSBundle.mainBundle().URLForResource("data", withExtension: "plist")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        //取出数据
        let itemDict = dataSource.objectAtIndex(indexPath.row) as! NSDictionary
        let item = Item(dict: itemDict as! [String : AnyObject])
        
        //把数据赋值给控件
        (cell.viewWithTag(1) as! UIImageView).image = UIImage(named: item.pic)
        (cell.viewWithTag(2) as! UILabel).text = item.name
        (cell.viewWithTag(3) as! UILabel).text = item.price
        (cell.viewWithTag(4) as! UILabel).text = item.hasSell
        
        return cell
    }

}
