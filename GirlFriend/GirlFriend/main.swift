//
//  main.swift
//  GirlFriend
//
//  Created by admin on 16/5/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation


//创建随机的1000个女朋友并打印出来
for var i in 0..<1000 {
    //随机名
    var name = randomString(6)
    //随机年龄
    var age = random(10, max: 30)
    
    //创建对象
    var girlFriend = GirlFriend(name: name, age: Int(age))
    
    //打印出来
    print(girlFriend.toString())
    
}
