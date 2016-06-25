//
//  ViewController.swift
//  painting
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    
    //保存按钮操作
    @IBAction func btnSave(sender: AnyObject) {
        boardView.saveImage()
    }
    
    //清空按钮操作
    @IBAction func btnClean(sender: AnyObject) {
        boardView.clear()
    }
    
    //修改线条大小
    @IBAction func changeLineWith(sender: AnyObject) {
        boardView.changeLineWith(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

}
