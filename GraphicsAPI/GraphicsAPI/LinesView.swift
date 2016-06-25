//
//  LinesView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/18.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class LinesView: UIView {

    
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor)
        CGContextSetLineWidth(context, 10)
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 200, 200)
        CGContextStrokePath(context)
    }
    

}
