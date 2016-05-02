//
//  BoyStudent.swift
//  L03
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

class BoyStudent: Student {
    init(age: Int, name: String) {
        super.init(age: age, name: name, gender: Gender.Male)
    }
    
    override func sayHello() {
        super.sayHello()
        print("这是重写过的sayHello")
    }
    
}