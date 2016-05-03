//
//  RandomUtil.swift
//  GirlFriend
//
//  Created by admin on 16/5/4.
//  Copyright © 2016年 yicheng. All rights reserved.
//
//
import Foundation


//生成随机数(from: http://bbs.9ria.com/thread-436832-1-1.html )
func random(min: UInt32,max: UInt32) -> UInt32 {
    return  arc4random_uniform(max - min) + min
}

//生成随机字符串(from: http://bbs.9ria.com/thread-436832-1-1.html )
func randomString(len: Int) -> String {
    let min: UInt32 = 65, max: UInt32 = 90
    var string = ""
    for _ in 0..<len{
        string.append(UnicodeScalar(random(min,max: max)))
    }
    return string
}

