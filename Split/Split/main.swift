//
//  main.swift
//  Split
//
//  Created by admin on 16/5/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

let str: NSString = "Hello&jikexueyuan&hello&"
print(str.split("&")) // 输出 [Hello, jikexueyuan, Hello]
print(str.split("jikexueyuan")) // 输出 [Hello&, &Hello]
