//
//  RectView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/18.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class RectView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        /** 绘制矩形. */
        //填充的颜色
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        //实心矩形
        CGContextFillRect(context, CGRect(x: 100, y: 100, width: 100, height: 100))
        
        //边框宽度
        CGContextSetLineWidth(context, 5)
        //边框颜色
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        //空心有边框的矩形
        CGContextStrokeRect(context, CGRect(x: 100, y: 100, width: 100, height: 100))
        
        
        
    }
 

}
