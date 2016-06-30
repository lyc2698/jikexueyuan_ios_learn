//
//  ViewController.swift
//  PlaySong
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var aPlayer: AVAudioPlayer!
    var aRecord: AVAudioRecorder!
    //储存录音文件位置
    var audioFileUrl: NSURL!
    
    @IBAction func play(sender: AnyObject) {
        aPlayer.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        aPlayer.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        aPlayer.stop()
        aPlayer.currentTime = 0
    }
    
    @IBAction func startRecord(sender: AnyObject) {
        print("startRecord")
        aRecord.record()
    }

    @IBAction func stopRecord(sender: AnyObject) {
        print("stopRecord")
        aRecord.stop()
    }
    
    @IBAction func playRecord(sender: AnyObject) {
        print("playRecord")
        do {
            aPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl)
            aPlayer.prepareToPlay()
            aPlayer.play()
        } catch {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try initAudio()
        } catch {}
        
    }
    
    func initAudio() throws{
        aPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ghsy", ofType: "mp3")!))
        
        audioFileUrl = (NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomains: NSSearchPathDomainMask.AllDomainsMask)[0] as NSURL).URLByAppendingPathComponent("rec")
        
        aRecord = try AVAudioRecorder(URL: audioFileUrl, settings: [:])
        aRecord.prepareToRecord()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(aPlayer.currentTime)
    }



}

