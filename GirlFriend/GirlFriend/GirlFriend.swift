//
//  GirlFriend.swift
//  GirlFriend
//
//  Created by admin on 16/5/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

/**
 * 女朋友对象
 * 包含名字、年龄、约会功能
 */
public class GirlFriend {
    //名字
    private var _name:String
    //年龄
    private var _age:Int
    
    init(name:String, age:Int){
        _name = name
        _age = age
    }
    
    public var name:String {
        get {
            return _name
        }
    }
    
    public var age:Int {
        get {
            return _age
        }
    }
    
    public func haveAnAppointment() -> String{
      return "年龄为\(_age)的\(_name)可约会"
    }
    
}
