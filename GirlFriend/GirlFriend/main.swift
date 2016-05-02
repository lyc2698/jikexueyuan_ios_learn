//
//  main.swift
//  GirlFriend
//
//  Created by admin on 16/5/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

//生成随机数(from: http://bbs.9ria.com/thread-436832-1-1.html )
func random(min:UInt32,max:UInt32)->UInt32{
    return  arc4random_uniform(max-min)+min
}

//生成随机字符串(from: http://bbs.9ria.com/thread-436832-1-1.html )
func randomString(len:Int)->String{
    let min:UInt32=65,max:UInt32=90
    var string=""
    for _ in 0..<len{
        string.append(UnicodeScalar(random(min,max:max)))
    }
    return string
}

//创建随机的1000个女朋友并打印出来
for var i in 0..<1000 {
    //随机名
    var name = randomString(6)
    //随机年龄
    var age = random(10, max: 30)
    
    //创建对象
    var girlFriend = GirlFriend(name: name, age: Int(age))
    
    //打印出来
    print("id:\(i), 名字: \(girlFriend.name), 年龄: \(girlFriend.age), \(girlFriend.haveAnAppointment())")
    
}
