//
//  ViewController.swift
//  AppDownload
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var appDownload: AppDownloadView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下载进度
        appDownload.progress = 0.05
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

