//
//  BoardView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var path = CGPathCreateMutable()
    
    /** 开始按下. */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let point = touches.first?.locationInView(self)
        
        CGPathMoveToPoint(path, nil, (point?.x)!, (point?.y)!)
    }
    
    /** 移动. */
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let point = touches.first?.locationInView(self)
        
        CGPathAddLineToPoint(path, nil, (point?.x)!, (point?.y)!)
        
        setNeedsDisplay()
    }
    
    /** 绘画. */
    override func drawRect(rect: CGRect) {
        
        let c = UIGraphicsGetCurrentContext()
        
        CGContextAddPath(c, path)
        CGContextStrokePath(c)
    }
 

}
