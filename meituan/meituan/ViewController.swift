//
//  ViewController.swift
//  meituan
//
//  Created by admin on 16/6/12.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    private let TAG_TITLE = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(TAG_TITLE) as! UILabel
        label.text = "Item \(indexPath.row)"
        
        return cell
    }


}

