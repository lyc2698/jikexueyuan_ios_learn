//
//  Item.swift
//  NavigationController
//
//  Created by admin on 16/6/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit
/** 团购内容模型. */
class Item: NSObject {
    var name: String!       //名字
    var price: String!      //价格
    var pic: String!        //图片名
    var hasSell: String!    //已售数量
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.setValuesForKeysWithDictionary(dict)
    }
    
}
