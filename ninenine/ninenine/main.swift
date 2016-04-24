//
//  main.swift
//  ninenine
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

//行
for var row in 1...9 {
    //列
    for var col in 1...row {
        //乘积
        var product = col * row
        
        /**
        * 打印算式
        * 判断乘积是否大于9，以添加不同的空格个数，仅为美观
        * 此处处理得不够通用，若100*100乘法表则又会出现不美观的情况
        */
        print("\(col)*\(row)=\(product)", terminator: product > 9 ? "   " : "    ")
    }
    //换行
    print(terminator:"\n")
}

