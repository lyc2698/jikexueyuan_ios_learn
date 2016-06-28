//
//  ViewController.swift
//  Transform
//
//  Created by admin on 16/6/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    var isRunning: Bool = true
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if isRunning {
            timer = NSTimer.scheduledTimerWithTimeInterval(1,
                                                               target: self,
                                                               selector: #selector(ViewController.action),
                                                               userInfo: nil,
                                                               repeats: true)
        } else {
            timer?.invalidate()
        }
        isRunning = !isRunning
    }
    
    /** 让4个 view 都动起来. */
    func action() {
        UIView.animateWithDuration(1,
                                   delay: 0,
                                   options: UIViewAnimationOptions.Repeat,
                                   animations: {
                                    self.randomAnimation(self.redView)
                                    self.randomAnimation(self.blueView)
                                    self.randomAnimation(self.greenView)
                                    self.randomAnimation(self.blackView)
            }, completion: nil)
    }
    
    /** 随机动画. */
    func randomAnimation(myView: UIView) {
        let flag = Int(arc4random_uniform(uint(4)))
        
        var myUIViewAnimationTransition: UIViewAnimationTransition;
        switch flag {
        case 1:
            myUIViewAnimationTransition = .FlipFromLeft
        case 2:
            myUIViewAnimationTransition = .FlipFromRight
        case 3:
            myUIViewAnimationTransition = .CurlDown
        case 4:
            myUIViewAnimationTransition = .CurlUp
        default:
            myUIViewAnimationTransition = .FlipFromLeft
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationTransition(myUIViewAnimationTransition, forView: myView, cache: true)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.commitAnimations()
    }
}

