//
//  ViewController.swift
//  scrollView
//
//  Created by admin on 16/6/29.
//  Copyright © 2016年 yicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var galleryScrollView: UIScrollView!
    @IBOutlet weak var galleryPageControl: UIPageControl!
    
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pictureGallery()
    }
    
    func pictureGallery(){   //实现图片滚动播放；
        //image width
        let imageW:CGFloat = self.galleryScrollView.frame.size.width;//获取ScrollView的宽作为图片的宽；
        let imageH:CGFloat = self.galleryScrollView.frame.size.height;//获取ScrollView的高作为图片的高；
        let imageY:CGFloat = 0;//图片的Y坐标就在ScrollView的顶端；
        let totalCount:NSInteger = 5;//轮播的图片数量；
        for index in 0..<totalCount{
            let imageView:UIImageView = UIImageView();
            let imageX:CGFloat = CGFloat(index) * imageW;
            imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);//设置图片的大小，注意Image和ScrollView的关系，其实几张图片是按顺序从左向右依次放置在ScrollView中的，但是ScrollView在界面中显示的只是一张图片的大小，效果类似与画廊；
            imageView.image = UIImage(named: "\(index+1)");
            self.galleryScrollView.showsHorizontalScrollIndicator = false;//不设置水平滚动条；
            imageView.clipsToBounds = true
            imageView.userInteractionEnabled = true
            self.galleryScrollView.addSubview(imageView);//把图片加入到ScrollView中去，实现轮播的效果；
        }
        
        //需要非常注意的是：ScrollView控件一定要设置contentSize;包括长和宽；
        let contentW:CGFloat = imageW * CGFloat(totalCount);//这里的宽度就是所有的图片宽度之和；
        self.galleryScrollView.contentSize = CGSizeMake(contentW, 0)
        self.galleryScrollView.pagingEnabled = true;
        self.galleryScrollView.delegate = self;
        self.galleryPageControl.numberOfPages = totalCount;//下面的页码提示器；
        self.addTimer()
    }
    
    func nextImage(sender:AnyObject!){//图片轮播；
        var page:Int = self.galleryPageControl.currentPage;
        if(page == 4){   //循环；
            page = 0;
        }else{
            page+=1;
        }
        let x:CGFloat = CGFloat(page) * self.galleryScrollView.frame.size.width;
        self.galleryScrollView.contentOffset = CGPointMake(x, 0);//注意：contentOffset就是设置ScrollView的偏移；
    }
    
    //UIScrollViewDelegate中重写的方法；
    //处理所有ScrollView的滚动之后的事件，注意 不是执行滚动的事件；
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //这里的代码是在ScrollView滚动后执行的操作，并不是执行ScrollView的代码；
        //这里只是为了设置下面的页码提示器；该操作是在图片滚动之后操作的；
        let scrollviewW:CGFloat = galleryScrollView.frame.size.width;
        let x:CGFloat = galleryScrollView.contentOffset.x;
        let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW);
        self.galleryPageControl.currentPage = page;
    }
    
    func addTimer(){   //图片轮播的定时器；
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(ViewController.nextImage(_:)), userInfo: nil, repeats: true);
    }


}

