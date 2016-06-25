//
//  myUIView.swift
//  painting
//
//  Created by admin on 16/6/19.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit


//上一次画的点坐标
var lastPoint: CGPoint = CGPoint(x: 0, y: 0);

class myUIView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor)
        CGContextSetLineWidth(context, 10)
        
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 200, 200)
        
        CGContextStrokePath(context)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let beginPoint = touches.first?.locationInView(self)
        lastPoint = beginPoint!
        print("touchesBegan: \(beginPoint)")
//        drawLine(beginPoint!, endPoint: beginPoint!)
        
        drawRect(CGRect());
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let beginPoint = touches.first?.locationInView(self)
//        drawLine(lastPoint, endPoint: beginPoint!)
        
        lastPoint = beginPoint!
        
        drawLine(CGPoint(x: 100, y: 100), endPoint: CGPoint(x: 200,y: 200))
        
        print("touchesEnded: \(beginPoint)")
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let beginPoint = touches.first?.locationInView(self)
        print("touchesMoved: \(beginPoint)")
    }
    
    /** 绘画函数. */
    func drawLine(beginPoint: CGPoint, endPoint: CGPoint) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor)
        CGContextSetLineWidth(context, 10)
        
        CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        
        CGContextStrokePath(context)
    }
 

}
