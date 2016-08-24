//
//  ViewController.swift
//  DynamicView
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UICollisionBehaviorDelegate{

    var animator: UIDynamicAnimator!
    var cmm: CMMotionManager!
    var gravity: UIGravityBehavior!
    
    let myQue = NSOperationQueue.mainQueue()    //主线程
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.run()
    }
    
    func run() {
        cmm = CMMotionManager.init()
        cmm.accelerometerUpdateInterval = 0.3
        
        if cmm.accelerometerAvailable {
            cmm.startAccelerometerUpdatesToQueue(self.myQue,
                withHandler: {
                (data: CMAccelerometerData?, err: NSError?) in
                
                let x: CGFloat = CGFloat(data!.acceleration.x)
                let y: CGFloat = CGFloat(data!.acceleration.y)
                self.gravity.gravityDirection = CGVectorMake(1*x, -1*y)
            })
        }else {
            print("is not available")
        }
        
        self.addBall()
    }
    
    func rotetePhone(data: CMAccelerometerData) {

    }

    /** 添加小球到界面. */
    func addBall() {
        let ball = BallView.init(frame: CGRectMake(100, 100, 44, 44))
        self.view.addSubview(ball)
        
        self.gravity = UIGravityBehavior.init(items: [ball])
        
        let collsion = UICollisionBehavior.init(items: [ball])
        
        collsion.translatesReferenceBoundsIntoBoundary = true
        
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        self.animator.addBehavior(gravity)
        self.animator.addBehavior(collsion)
    }
    
    override func viewWillDisappear(animated: Bool) {
        cmm.stopAccelerometerUpdates()
    }
    
}

