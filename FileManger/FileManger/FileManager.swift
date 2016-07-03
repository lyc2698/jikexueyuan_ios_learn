//
//  FileManager.swift
//  FileManager
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

/**
 * 文件管理类
 */
class FileManager {
    let systemFileManager = NSFileManager.defaultManager();
    //获取 Document 目录
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    var result = Result()
    
    /** 目录创建. */
    func directoryCreate(directoryName: String) -> Bool {
        let path = fullPath(documentsPath, fileName: directoryName)
        
        do {
            try systemFileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
            print(documentsPath)
            return true
        } catch {
            return false
        }
    }
    
    /** 目录删除. */
    func directoryDelete(directoryName: String) -> Bool {
        let path = fullPath(documentsPath, fileName: directoryName)
        
        do {
            try systemFileManager.removeItemAtPath(path)
            return true
        } catch {
            return false
        }
    }
    
    /** 写内容(文本). */
    func fileWriteContent(fileName: String, content: String) -> Bool {
        let path = fullPath(documentsPath, fileName: fileName)
        
        do {
            try content.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
            return true
        } catch {
            return false
        }
    }
    
    /** 写内容(字典). */
    func fileWriteContent(fileName: String, content: Dictionary<String, AnyObject>) -> Bool {
        let path = fullPath(documentsPath, fileName: fileName)
        let content = content as NSDictionary
        
        let result = content.writeToFile(path, atomically: true)
        if result {
            return true
        } else {
            return false
        }
    }
    
    /** 写内容(数组). */
    func fileWriteContent(fileName: String, content:  Array<AnyObject>) -> Bool {
        let path = fullPath(documentsPath, fileName: fileName)
        let content = content as NSArray
        
        let result = content.writeToFile(path, atomically: true)
        if result {
            return true
        } else {
            return false
        }
    }
    
    /** 读内容(文本). */
    func fileReadContent(fileName: String) -> String {
        let path = fullPath(documentsPath, fileName: fileName)
        
        if let data = systemFileManager.contentsAtPath(path) {
            let content = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            return content
        }
        
        return ""
    }
    
    /** 读内容(字典). */
    func fileReadContent(fileName: String) -> Dictionary<String, AnyObject> {
        let path = fullPath(documentsPath, fileName: fileName)
        var content = Dictionary<String, AnyObject>()
        
        if systemFileManager.fileExistsAtPath(path) {
            content = NSDictionary.init(contentsOfFile: path) as! Dictionary<String, AnyObject>
        }
        
        return content
    }
    
    
    /** 读内容(字典). */
    func fileReadContent(fileName: String) -> Array<AnyObject> {
        let path = fullPath(documentsPath, fileName: fileName)
        var content = Array<AnyObject>()
        
        if systemFileManager.fileExistsAtPath(path) {
            content = NSArray.init(contentsOfFile: path) as! Array<AnyObject>
        }
        
        return content
    }
    
    /** 获取某个目录下所有文件. */
    func allFileAtPath(directoryName: String) -> Result {
        let path = fullPath(documentsPath, fileName: directoryName)
        
        //判断是否有该目录/文件
        let result = fileExist(directoryName)
        if !result.isSuccess() {
            return result
        }
        
        return result.success(systemFileManager.subpathsAtPath(path)!)
    }
    
    /** 文件是否存在. */
    func fileExist(fileName: String) -> Result {
        let path = fullPath(documentsPath, fileName: fileName)
        
        if !systemFileManager.fileExistsAtPath(path) {
            return result.error(1, msg: "目录不存在", data: false)
        }
        
        return result.success(true)
    }
    
    /** 计算某文件大小(单位字节). */
    func fileSize(fileName: String) -> Result {
        let path = fullPath(documentsPath, fileName: fileName)
        var fileAttributes: AnyObject?
        
        //判断是否有该目录/文件
        let result = fileExist(fileName)
        if !result.isSuccess() {
            return result
        }
        
        do{
            fileAttributes = try systemFileManager.attributesOfItemAtPath(path)
        } catch {
            print("计算文件大小异常")
        }
        
        let fileSize:AnyObject? = fileAttributes![NSFileSize]
        return result.success(fileSize as! Int)
    }
    
    /** 计算整个文件夹中所有文件大小. */
    func dictionarySize(directoryName: String) -> Result {
        let allFileArrayResult = allFileAtPath(directoryName)
        var allFileArray = [String]()
        
        if allFileArrayResult.isSuccess() {
            allFileArray = allFileArrayResult.data as! [String]
        }

        if allFileArray.count == 0 {
            return result.error(2, msg: "文件夹下无目录或文件")
        }
        
        var sizeCount = 0
        //遍历所有文件
        for filePath in allFileArray {
            //计算每个文件大小
            let fileFullPath = fullPath(directoryName, fileName: filePath)
            let fileSizeResult = self.fileSize(fileFullPath)
            if !fileSizeResult.isSuccess() {
                return fileSizeResult
            }
            let fileSize = fileSizeResult.data as! Int
                
            sizeCount += fileSize
            
            print("文件路径: \(fileFullPath)")
            print("文件大小: \(fileSize)")
        }
        
        return result.success(sizeCount)
    }
    
    /** 删除文件. */
    func fileDelete(fileName: String) -> Bool {
        return directoryDelete(fileName)
    }
    
    /** 移动文件. */
    func fileMove(fromPath: String, toPath: String) -> Bool {
        let fromPathFull = fullPath(documentsPath, fileName: fromPath)
        let toPathFull = fullPath(documentsPath, fileName: toPath)
        
        do{
            try systemFileManager.moveItemAtPath(fromPathFull, toPath: toPathFull)
            return true
        } catch {
            return false
        }
    }
    
    
    /** 拼接目录和文件名,返回完整路径. */
    private func fullPath(directory: String, fileName: String) -> String {
        return directory + "/" + fileName
    }
    
}
