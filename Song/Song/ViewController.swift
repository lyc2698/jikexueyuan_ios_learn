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
        let lrc = Lrc()
        let result = lrc.getLrc("yy")
        
        lrcTime = result.lrcTime
        lrcContent = result.lrcContent
        
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

}

