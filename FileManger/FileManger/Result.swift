//
//  Result.swift
//  FileManager
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class Result{
    var status: Int
    var msg: String
    var data: AnyObject
    
    init(){
        status = 0
        msg = "成功"
        data = [:]
    }
    
    func success(data: AnyObject) -> Result {
        let result = Result()
        result.data = data
        
        return result
    }
    
    func error(status: Int = -1, msg: String = "失败", data: AnyObject = [:]) -> Result {
        let result = Result()
        result.status = status
        result.msg = msg
        result.data = data
        
        return result
    }
    
    func isSuccess() -> Bool {
        if status == 0 {
            return true
        }
        
        return false
    }
    
    func description() -> String {
        return "status: \(status), msg: \(msg), data: \(data)"
    }
    
}
