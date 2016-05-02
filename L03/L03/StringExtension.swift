//
//  StringExtension.swift
//  L03
//
//  Created by admin on 16/4/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation


extension String {
    func endWith(end:String) -> Bool {
        var result = true
        let rAll = self.characters.reverse()
        let rEnd = end.characters.reverse()
        
        for i in 0 ..< rEnd.count {
            if rAll[rAll.startIndex.advancedBy(i)] != rEnd[rEnd.startIndex.advancedBy(i)]{
                result = false
                break
            }
        }
        
        return result
    }
}