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
//let s:String? = "Hello Swift"
//let index = s?.startIndex.advancedBy(3)
//let subString = s?.substringToIndex(index!)
//
//print(index)
//print(subString)


//let s:ImplicitlyUnwrappedOptional<String> = "Hello Swift"
//let s:String! = nil
//
//print(s)


//func add(a:Int,b:Int) -> Int{
//    return a + b
//}
//
//print(add(2, b: 3))

//enum Direction: Int{
//    case Up = 1
//    case Right = 2
//    case Down = 3
//    case Left = 4
//    
//    func getRotation() -> Int {
//        switch self {
//        case .Up:
//            return 0
//        case .Right:
//            return 90
//        case .Down:
//            return 180
//        case .Left:
//            return 270
//        }
//    }
//}
//
//print(Direction.Left.getRotation())


/** 结构体. */

//struct Student {
//    var name:String
//    var age:Int
//    
//    //构造函数
//    init(name: String = "jikexueyuan", age: Int = 20){
//        self.name = name
//        self.age = age
//    }
//    
//    func toString() -> String {
//        return "年龄：\(age), 名字：\(name)"
//    }
//}
//
//var s = Student()
//print(s.toString())


/** 字符. */

let s:NSString = "Hello Swift"
let swiftStr:String = s as String
let ocStr = swiftStr as NSString

let startIndex = swiftStr.startIndex
//var subString = swiftStr.substringFromIndex(startIndex.advancedBy(5))
//var subString = swiftStr.substringToIndex(startIndex.advancedBy(5))
//var subString  = swiftStr.substringWithRange(startIndex.advancedBy(2)...startIndex.advancedBy(6))

//var subString  = ocStr.substringToIndex(5)
//var subString = ocStr.substringWithRange(NSRange(location: 2, length: 3))


//let result = swiftStr.characters.split(" ")
//
//for o in result {
//    print(String(o))
//}

//var content = "Hello {Xcode} Swift"
//var tmpString:String = ""
//
//for ch in content.characters {
//    tmpString.append(ch)
//    print(ch)
//}
//
//print(tmpString)


var smile = "😓🙅🏽🇫🇷"

print(smile)
















