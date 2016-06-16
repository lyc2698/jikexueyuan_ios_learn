//
//  Item.swift
//  NavigationController
//
//  Created by admin on 16/6/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String!
    var price: String!
    var pic: String!
    var hasSell: String!
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.setValuesForKeysWithDictionary(dict)
    }
    
}
