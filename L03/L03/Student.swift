//
//  Student.swift
//  L03
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import Foundation

public enum Gender:String {
    case Male = "男"
    case Female = "女"
}

public class Student:NSObject, Human {
    private var _age:Int
    private var _name:String
    private var _gender:Gender
    
    init(age:Int, name:String, gender:Gender = Gender.Female){
        _age = age
        _name = name
        _gender = gender
    }
    
    public func sayHello(){
        print("\(_name) say Hello")
    }
    
    public func sayHello(to:Student){
        print("\(_name) say Hello to \(to.name)")
    }
    
    public func getAge() -> Int {
        return _age
    }
    
    public var name:String {
        get{
            print("正在设置Name")
            return _name
        }
        
        set{
            _name = newValue
        }
    }
    
    public override var description: String{
        get {
            return "name:\(_name), age:\(_age)"
        }
    }
    
    public func eat() {
        print("\(name) eat")
    }
    
}