//
//  ImageView.swift
//  GraphicsAPI
//
//  Created by admin on 16/6/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ImageView: UIView {

    var myUIImage = UIImage(named: "1")?.CGImage
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let c = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(c)
        CGContextTranslateCTM(c, 10, 400)
        CGContextScaleCTM(c, 1, -1)
        
        CGContextDrawImage(c, CGRect(x: 0, y: 0, width: 100, height: 100), myUIImage)
        CGContextRestoreGState(c)
    }
 

}
