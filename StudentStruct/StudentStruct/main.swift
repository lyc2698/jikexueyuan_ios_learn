//
//  main.swift
//  StudentStruct
//  定义学生结构体，构造10个学生，按平局分从低到高排列
//  1. 定义学生结构体
//  2. 随机产生10个学生
//  3. 排序
//  4. 打印结果
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

//学生结构体
struct Student {
    //姓名
    var name:String
    //数学成绩
    var MathScore:Int
    //英语成绩
    var EnglishScore:Int
    //平均分
    var avgScore:Float = 0
    
    //构造方法
    init(name:String, MathScore:Int, EnglishScore:Int){
        self.name = name
        self.MathScore = MathScore
        self.EnglishScore = EnglishScore
        self.avgScore = avg()
    }
    
    //求平均分
    func avg() -> Float {
        return Float(self.MathScore + self.EnglishScore)/2
    }
}

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


//构造10个学生结构体并放入数组中
var studentArray = [Student]()
for var i in 0..<10{
    var name:String = randomString(6)
    var MathScore:Int = Int(random(10, max: 100))
    var EnglishScore:Int = Int(random(10, max: 100))
    
    var student = Student(name: name, MathScore: MathScore, EnglishScore: EnglishScore)
    studentArray.append(student)
}

//利用Swift自带的数组排序(从低到高)
let studentSortResult = studentArray.sort { (s1, s2) -> Bool in
    return s1.avg() < s2.avg()
}

//输出结果
for var student in studentSortResult {
    print("\(student.name) 的平均分是: \(student.avgScore), 数学: \(student.MathScore), 英语: \(student.EnglishScore)")
}







