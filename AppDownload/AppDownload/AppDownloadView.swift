//
//  AppDownloadView.swift
//  AppDownload
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class AppDownloadView: UIView {

    var progress: Double
    
    public init(frame: CGRect) {
        
    }
    
    public init?(coder aDecoder: NSCoder) {
        
    }
    
    override func drawRect(rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()
        
        /** 扇形和圆形. */
        CGContextMoveToPoint(c, 200, 200)
        CGContextAddLineToPoint(c, 250, 200)
        CGContextAddArc(c, 200, 200, 50, 0, CGFloat(M_PI * 2 * (1 - self.progress!)), 0)
        CGContextSetFillColorWithColor(c, UIColor.grayColor().CGColor)
        CGContextFillPath(c)
    }
 

}
