//
//  Lrc.swift
//  Song
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

class Lrc {
    var lrcName = ""
    var lrcTime = NSMutableArray()
    var lrcContent = NSMutableArray()
    
    /** 解析歌词. */
    func getLrc(lrcName: String) -> (lrcTime: NSMutableArray, lrcContent: NSMutableArray) {
        let content =  try! NSString(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(lrcName, ofType: "lrc")!), encoding: NSUTF8StringEncoding)
        let array = content.componentsSeparatedByString("\n")
        
        // 解析每一行
        for line in array {
            let lrcLine = line as String
            
            //定义正则表达式
            let pattern = "\\d{2}:\\d{2}.\\d{2}";
            let regular = try! NSRegularExpression(pattern: pattern, options:.CaseInsensitive)
            let results = regular.matchesInString(lrcLine, options: .ReportProgress , range: NSMakeRange(0, lrcLine.characters.count))
            //把结果放入数组
            for _ in results {
                let time = (lrcLine as NSString).substringWithRange(NSMakeRange(1, 5))
                let text = (lrcLine as NSString).substringFromIndex(11)
                
                lrcTime.addObject(timeToSecond(time))
                lrcContent.addObject(text)
            }
        }
        
        return (lrcTime, lrcContent)
    }
    
    /** 把时间字符串转换成整数型. */
    func timeToSecond(time: NSString) -> Int {
        var array = time.componentsSeparatedByString(":")
        return  Int(array[0])! * 60 + Int(array[1])!
    }

}