//
//  TableViewController.swift
//  TODO
//
//  Created by admin on 16/6/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

//储存数据的数组
var arrayData: [String] = []

class TableViewController: UITableViewController{

    @IBOutlet weak var add: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置左上角按钮为编辑按钮
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let label = cell.viewWithTag(1) as! UILabel
        label.text = arrayData[indexPath.row]
        
        return cell
    }
    
    //左滑删除功能
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            arrayData.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    //左边设置功能
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.tableView.setEditing(editing, animated: animated)
    }
 
    //右边添加按钮点击事件
    @IBAction func addClick(sender: AnyObject) {
        let date = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd HH:mm:ss.SSS"
        let strNowTime = timeFormatter.stringFromDate(date) as String
        
        arrayData.insert(strNowTime, atIndex: 0)
        
        self.tableView.reloadData()
        
    }
    
    //点击 cell 后跳转到内容页
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let contentVc = storyboard?.instantiateViewControllerWithIdentifier("ContentVC") as! ContentViewController
        
        contentVc.setContent(arrayData[indexPath.row])
        
        navigationController?.pushViewController(contentVc, animated: true)
    }

}
