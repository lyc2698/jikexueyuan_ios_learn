//
//  CircleView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/18.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class CircleView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let c = UIGraphicsGetCurrentContext()
        
        /** 扇形和圆形. */
        CGContextMoveToPoint(c, 200, 200)
        CGContextAddLineToPoint(c, 250, 200)
        CGContextAddArc(c, 200, 200, 50, 0, CGFloat(M_PI)/2, 0)
        CGContextSetFillColorWithColor(c, UIColor.redColor().CGColor)
        CGContextFillPath(c)
        
        /** 圆形. */
        CGContextFillEllipseInRect(c, CGRect(x: 100, y: 300, width: 100, height: 100))
        
    }
 

}
