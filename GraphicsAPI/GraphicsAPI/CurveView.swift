//
//  CurveView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/19.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class CurveView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let c = UIGraphicsGetCurrentContext()
        
        CGContextMoveToPoint(c, 0, 200)
//        CGContextAddQuadCurveToPoint(c, 100, 0, 200, 200)
        CGContextAddCurveToPoint(c, 100, 0, 100, 400, 200, 200)
        CGContextStrokePath(c)
    }
 

}
