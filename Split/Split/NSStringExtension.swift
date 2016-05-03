//
//  NSStringExtension.swift
//  Split
//
//  Created by admin on 16/5/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

extension NSString {
    
    /**
     * 功能: 将字符串分割成若干数组
     * 
     * 开发逻辑:
     * 将字符串切割为“分割字符串”等长度的字符串进行比较
     * 若相等, 则提取出来之前的字符串
     */
    func split(splitString: NSString) -> [String]  {
        //返回的字符串结果
        var returnArray = [String]()
        //开始截取字符串的标识
        var startFlag = 0
        
        //要处理的字符串
        for i in 0 ... (self.length - splitString.length) {
            //放进数组里的字符串
            var itemString = ""
            //截取和分割字符串一样长度的字符
            let selfSubString = self.substringWithRange(NSRange(location: i, length: splitString.length))
            
            //如果截取的字符与分割字符相等
            if selfSubString == splitString {
                //把这部分字符串到上一次相等之间的字符串提出来
                itemString  = self.substringWithRange(NSRange(location: startFlag, length: i - startFlag))
                returnArray.append(itemString)
                
                //开始截取的起点应该减去分割字符串的长度
                startFlag = i + splitString.length
            }
        }
        
        //剩下的最后字符串
        let endString: String = self.substringFromIndex(startFlag)
        if !endString.isEmpty {
            returnArray.append(endString)
        }
        
        return returnArray
    }
}