//
//  main.swift
//  HelloSwitft
//
//  Created by admin on 16/4/24.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

//let s = "Hello Swift"
//let s1 = s + ", Java"
//let s2 = "\(s1)10"

//print(s2)

//var arr = [2,3,4,5.2, "Swift"]
//arr.append(100)
//arr.removeFirst(2)

//var arr = [2]
//arr.append(3)
//
//print(arr)


//var dict = [NSObject: NSObject]()
////var dict = ["name": "极客学院", "age": 2]
////dict.removeAtIndex(dict.startIndex)
//dict["language"] = "Java"
//dict[1] = 100
//
//print(dict[1])
//
//let score = 92
//
////if(score >= 90){
////    print("优秀")
////}
//
//switch(score/10){
//case 9:
//    print("优秀")
//    
//default:
//print("没有这个选项")
//}

//let r = 90..<100

//print(r)
//r.forEach { (i: Int) in
//    print(i)
//}


//for var i in r {
//    print(i)
//}

//for var i in 0...10 {
//  
//    if i == 5 {
//        continue
//    }
//    
//    print(i)
//}


//repeat{
//    print("循环")
//}while false


//let s:Optional<String> = nil
let s:String? = "Hello Swift"
let index = s?.startIndex.advancedBy(3)
let subString = s?.substringToIndex(index!)

print(index)
print(subString)


//let s:ImplicitlyUnwrappedOptional<String> = "Hello Swift"
//let s:String! = nil
//
//print(s)











