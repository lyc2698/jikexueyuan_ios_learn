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
class FileManager: NSObject {
    let systemFileManager = NSFileManager.defaultManager();
    //获取 Document 目录
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    
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
    @nonobjc
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
    @nonobjc
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
    @nonobjc
    func fileReadContent(fileName: String) -> Dictionary<String, AnyObject> {
        let path = fullPath(documentsPath, fileName: fileName)
        var content = Dictionary<String, AnyObject>()
        
        if systemFileManager.fileExistsAtPath(path) {
            content = NSDictionary.init(contentsOfFile: path) as! Dictionary<String, AnyObject>
        }
        
        return content
    }
    
    
    /** 读内容(字典). */
    @nonobjc
    func fileReadContent(fileName: String) -> Array<AnyObject> {
        let path = fullPath(documentsPath, fileName: fileName)
        var content = Array<AnyObject>()
        
        if systemFileManager.fileExistsAtPath(path) {
            content = NSArray.init(contentsOfFile: path) as! Array<AnyObject>
        }
        
        return content
    }
    
    /** 获取某个目录下所有文件. */
    func allFileAtPath(directoryName: String) -> Array<String> {
        let path = fullPath(documentsPath, fileName: directoryName)
        
        return systemFileManager.subpathsAtPath(path)!
    }
    
    /** 文件是否存在. */
    func fileExist(fileName: String) -> Bool {
        let path = fullPath(documentsPath, fileName: fileName)
        
        return systemFileManager.fileExistsAtPath(path)
    }
    
    /** 计算某文件大小(单位字节). */
    func fileSize(fileName: String) -> Int {
        let path = fullPath(documentsPath, fileName: fileName)
        var fileAttributes: AnyObject?
        
        if systemFileManager.fileExistsAtPath(path) {
            do{
                fileAttributes = try systemFileManager.attributesOfItemAtPath(path)
            } catch {
                print("计算文件大小异常")
            }
            
            let fileSize:AnyObject? = fileAttributes![NSFileSize]
            return fileSize as! Int
        }
        
        return 0
    }
    
    /** 计算整个文件夹中所有文件大小. */
    func dictionarySize(directoryName: String) -> Int {
        let allFileArray = allFileAtPath(directoryName)
        var sizeCount = 0
        
        //遍历所有文件
        for filePath in allFileArray {
            //计算每个文件大小
            let fileFullPath = fullPath(directoryName, fileName: filePath)
            let fileSize = self.fileSize(fileFullPath)
            sizeCount += fileSize
            
            print("文件路径: \(fileFullPath)")
            print("文件大小: \(fileSize)")
        }
        
        return sizeCount
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
