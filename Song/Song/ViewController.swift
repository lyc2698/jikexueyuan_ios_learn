//
//  ViewController.swift
//  Song
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var lrcTime = NSMutableArray()
    var lrcContent = NSMutableArray()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取歌词放入字典
        getLrc()
        
        //加载音乐
        player = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("yy", ofType: "mp3")!))
        //播放音乐
        player.play()
        
        //定时器
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.show), userInfo: nil, repeats: true)
    }
    
    /** 展示歌词. */
    func show() {
        for i in 0 ..< lrcTime.count {
            if fabs(lrcTime[i] as! Double - (player.currentTime)) <= fabs(0.1) {
                myLabel.text = lrcContent[i] as? String
                return
            }
        }
    }

    /** 解析歌词. */
    func getLrc()  {
        let content =  try! NSString(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("yy", ofType: "lrc")!), encoding: NSUTF8StringEncoding)
        let array = content.componentsSeparatedByString("\n")
        
        // 解析每一行
        for line in array {
            let lrcLine = line as String
        
            //定义正则表达式
            let pattern = "\\d{2}:\\d{2}.\\d{2}";
            let regular = try! NSRegularExpression(pattern: pattern, options:.CaseInsensitive)
            let results = regular.matchesInString(lrcLine, options: .ReportProgress , range: NSMakeRange(0, lrcLine.characters.count))
            //把结果放入数组
            for _ in results {
                let time = (lrcLine as NSString).substringWithRange(NSMakeRange(1, 5))
                let text = (lrcLine as NSString).substringFromIndex(11)
                
                lrcTime.addObject(timeToSecond(time))
                lrcContent.addObject(text)
            }
        
        }
    }
   
    /** 把时间字符串转换成整数型. */
    func timeToSecond(time: NSString) -> Int {
        var array = time.componentsSeparatedByString(":")
        return  Int(array[0])! * 60 + Int(array[1])!
    }

}

