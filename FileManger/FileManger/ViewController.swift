//
//  ViewController.swift
//  FileManger
//
//  Created by admin on 16/7/3.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //文件管理类
    var fileManager: FileManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileManager = FileManager()
    }
    
    /** 创建目录. */
    @IBAction func directoryCreate(sender: AnyObject) {
        fileManager.directoryCreate("123测试")
    }
    
    /** 删除目录. */
    @IBAction func directoryDelete(sender: AnyObject) {
        fileManager.directoryDelete("123测试")
    }

    /** 写内容(文本). */
    @IBAction func fileWriteText(sender: AnyObject) {
        fileManager.fileWriteContent("fileText", content: "acacscsacsacsa")
    }

    /** 写内容(字典). */
    @IBAction func fileWriteDictionary(sender: AnyObject) {
        let dict = ["name": "zhangsann", "school": "daxue", "age": 18]
        
        fileManager.fileWriteContent("fileDictionary", content: dict)
    }

    /** 写内容(数组). */
    @IBAction func fileWriteArray(sender: AnyObject) {
        let array = ["a", "c"]
        
        fileManager.fileWriteContent("fileArray", content: array)
    }
    
    /** 读内容(文本). */
    @IBAction func fileReadText(sender: AnyObject) {
        let content = fileManager.fileReadContent("fileText") as String
        print(content)
    }
    
    /** 读内容(字典). */
    @IBAction func fileReadDictionary(sender: AnyObject) {
        let content = fileManager.fileReadContent("fileDictionary") as Dictionary
        print(content)
    }
    
    /** 读内容(数组). */
    @IBAction func fileReadArray(sender: AnyObject) {
        let content = fileManager.fileReadContent("fileArray") as Array
        print(content)
        
    }
    
    /** 获取某个目录下所有文件. */
    @IBAction func allFileAtPath(sender: AnyObject) {
        let result = fileManager.allFileAtPath("")
        print(result)
    }
    
    /** 文件是否存在. */
    @IBAction func fileExist(sender: AnyObject) {
        let result = fileManager.fileExist("fileDictionary")
        print(result)
    }
    
    /** 计算某个文件大小. */
    @IBAction func fileSize(sender: AnyObject) {
        let result = fileManager.fileSize("fileDictionary")
        print(result)
    }
    
    /** 计算整个文件夹中所有文件大小. */
    @IBAction func dictionarySize(sender: AnyObject) {
        let result = fileManager.dictionarySize("未命名文件夹")
        print(result)
    }
    
    /** 删除文件. */
    @IBAction func fileDelete(sender: AnyObject) {
        let result = fileManager.fileDelete("fileText")
        print(result)
    }
    
    /** 移动文件. */
    @IBAction func fileMove(sender: AnyObject) {
        let result = fileManager.fileMove("fileText", toPath: "fileTexta")
        print(result)
    }
    
    
}

