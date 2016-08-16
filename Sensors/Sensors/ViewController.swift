//
//  ViewController.swift
//  Sensors
//
//  Created by admin on 16/7/6.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var imgMiddle : UIImageView! //中间照片图
    var imgLeft   : UIImageView! //左边
    var imgRight  : UIImageView! //右边
    var cmm       : CMMotionManager! //运动传感器
    
    var rotateX   : CGFloat!    //累计旋转值(陀螺仪旋转量累计加在里面)
    var imgWidth  : CGFloat!    //视图宽
    var imgHeight : CGFloat!    //视图高
    
    let myQue = NSOperationQueue.mainQueue()    //主线程
    
    let imageName = UIImage(named: "demo")
    
    var myScollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rotateX = 0
        cmm = CMMotionManager()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        //载入图片
        loadImg()
    }
    
    func loadImg() {
        //首先创建中间视图
        //换算,将图片的高度设置为屏幕的高度
        imgMiddle = UIImageView.init(image: imageName)
        
        imgWidth = imgMiddle.bounds.width
        imgHeight = imgMiddle.bounds.height
        
        //sizeRate 是 横屏高度与图片高度的比值, 用它来等比缩放图片
        let sizeRate = UIScreen.mainScreen().bounds.height / imgHeight
        
        imgWidth = imgWidth * sizeRate
        imgHeight = imgHeight * sizeRate
        
        imgMiddle.frame.size = CGSizeMake(imgWidth, imgHeight)
        imgMiddle.center = self.view.center
        self.view.addSubview(imgMiddle)
        
        //左边照片视图创建. 支持360°旋转, 因此1张照片用了3次, 放在左中右上
        let leftCenterX = imgMiddle.center.x - imgWidth
        let rightCenterX = imgMiddle.center.x + imgWidth
        let imgCenterY = imgMiddle.center.y
        
        imgLeft = UIImageView.init(image: imageName)
        imgLeft.frame.size = CGSizeMake(imgWidth, imgHeight)
        imgLeft.center = CGPointMake(leftCenterX, imgCenterY)
        self.view.addSubview(imgLeft)
        
        imgRight = UIImageView.init(image: imageName)
        imgRight.frame.size = CGSizeMake(imgWidth, imgHeight)
        imgRight.center = CGPointMake(rightCenterX, imgCenterY)
        self.view.addSubview(imgRight)
    }

    
    override func viewWillAppear(animated: Bool) {
        startGyro()
    }
    
    override func viewWillDisappear(animated: Bool) {
        stopGyro()
    }
    
    func startGyro() {
        cmm.gyroUpdateInterval = 1 / 60
        if cmm.gyroAvailable && !cmm.gyroActive {
            cmm.startGyroUpdatesToQueue(myQue, withHandler: { (data: CMGyroData?, error: NSError?) in
                self.rotatePhone(data!)
            })
        } else {
            print("Gyro is not available")
        }
    }
    
    func stopGyro() {
        if cmm.gyroAvailable {
            cmm.stopGyroUpdates()
        }
    }
    
    /**
    * 陀螺仪变化比较小, 放大倍数
    * 手机向左或右移动时, 把照片也移动一个照片宽带
    */
    func rotatePhone(data: CMGyroData) {
        //判断是否是竖屏状态, 竖屏使用data.rotationRate.y
        if (UIDevice.currentDevice().orientation.isPortrait) {
            rotateX = rotateX + CGFloat(data.rotationRate.y) * 9
        }else {
            rotateX = rotateX + CGFloat(data.rotationRate.x) * 9
        }
    
        if rotateX < -1 * imgWidth / 2 {
            //向右偏移一个照片单位
            rotateX = rotateX + imgWidth
            self.imgMiddle.center = self.imgRight.center
        }else if rotateX > imgWidth / 2 {
            //向左偏移一个单位
            rotateX = rotateX - imgWidth
            self.imgMiddle.center = self.imgLeft.center
        }else {
            let centerX: CGFloat = self.view.center.x + rotateX
            let centerY: CGFloat = self.view.center.y
            self.imgMiddle.center = CGPointMake(centerX, centerY)
        }
        
        movePic()
    }
    
    /**
    * 中间图动了之后, 调整左右图片的中心位置, 跟着动
    */
    func movePic() {
        let leftX = imgMiddle.center.x - imgWidth
        let rightX = imgMiddle.center.x + imgWidth
        let imgY = imgMiddle.center.y
        
        imgLeft.center = CGPointMake(leftX, imgY)
        imgRight.center = CGPointMake(rightX, imgY)
    }
    
    

}

