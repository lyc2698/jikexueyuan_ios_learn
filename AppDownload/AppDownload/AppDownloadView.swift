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
    var myCGRect: CGRect
    
    required init?(coder aDecoder: NSCoder) {
        progress = 0.1
        myCGRect = CGRect(x: 100, y: 100, width: 200, height: 200)
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()
        
        /** 外部圆角矩形. */
        CGContextSetAlpha(c, 0.5)
        let pathRect = UIEdgeInsetsInsetRect(myCGRect, UIEdgeInsetsMake(5, 5, 5, 5))
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        UIColor.grayColor().setFill()
        path.fill()
        
        /** 内部透明空心圆. */
        CGContextMoveToPoint(c, 200, 200)
        CGContextAddArc(c, 200, 200, 50, 0, CGFloat(M_PI * 2), 0)
        CGContextSetFillColorWithColor(c, UIColor.whiteColor().CGColor)
        CGContextSetAlpha(c, 1)
        CGContextFillPath(c)
        
        /** 内部圆(进度). */
        CGContextMoveToPoint(c, 200, 200)
        CGContextAddArc(c, 200, 200, 45, 0, CGFloat(M_PI * 2 * (1 - progress)), 0)
        CGContextSetFillColorWithColor(c, UIColor.grayColor().CGColor)
        CGContextSetAlpha(c, 0.7)
        CGContextFillPath(c)
    }
 

}
