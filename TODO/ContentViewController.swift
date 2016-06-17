//
//  ContentViewController.swift
//  TODO
//
//  Created by admin on 16/6/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    private var content:String!
    @IBOutlet weak var myContent: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        myContent.text = content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //设置内容
    func setContent(str: String) {
        self.content = str
    }

}
