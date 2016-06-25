//
//  BoardView.swift
//  painting
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class BoardView: UIView {

    var path: CGMutablePath?
    var lineWidth: Float
    
    required init?(coder aDecoder: NSCoder) {
        path = CGPathCreateMutable()
        lineWidth = 1
        super.init(coder: aDecoder)
    }
    
    /** 开始按下. */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            CGPathMoveToPoint(path, nil, point.x, point.y)
        }
    }
    
    /** 移动. */
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            CGPathAddLineToPoint(path, nil, point.x, point.y)
            setNeedsDisplay()
        }
    }
    
    /** 绘画. */
    override func drawRect(rect: CGRect) {
        
        let c = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(c, CGFloat.init(lineWidth))
        CGContextAddPath(c, path)
        CGContextStrokePath(c)
    }
    
    /** 修改宽度. */
    func changeLineWith(width: Float) {
        lineWidth = width
        setNeedsDisplay()
    }
    
    /** 保存图片. */
    func saveImage() {
        UIGraphicsBeginImageContext(self.bounds.size)
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let myImageView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(myImageView, self, #selector(BoardView.image(_: didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func image(image: UIImage,
                             didFinishSavingWithError: NSError?,
                                                      contextInfo: AnyObject) {
        if didFinishSavingWithError != nil {
            print("保存错误")
            return
        }
        print("保存成功")
    }
    
    /** 清空画板. */
    func clear() {
        path = nil
        setNeedsDisplay()
        path = CGPathCreateMutable()
    }
 

}
