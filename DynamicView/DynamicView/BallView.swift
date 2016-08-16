//
//  BallView.swift
//  DynamicView
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class BallView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yellowColor()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderWidth = 1
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
