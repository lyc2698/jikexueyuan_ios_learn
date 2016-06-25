//
//  ViewController.swift
//  AppDownload
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDownload = AppDownloadView()
        appDownload.setprogress(0.8)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

