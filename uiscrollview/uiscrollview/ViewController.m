//
//  ViewController.m
//  uiscrollview
//
//  Created by admin on 16/7/31.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView*myView;
@property(nonatomic,strong)UIImageView*img;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView*view1 = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    view1.backgroundColor = [UIColor yellowColor];
    
    //创建图片
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 4457, 888)];
    img.image = [UIImage imageNamed:@"shanghai.jpg"];
    
    self.img = img;
    
    [view1 addSubview:img];
    [self.view addSubview:view1];

    //可滚动的范围
    view1.contentSize = CGSizeMake(4457, 888);
    
    //显示的起始偏移
    view1.contentOffset = CGPointMake(2200, 0);
    
    //滚动条显示/消失
    view1.showsVerticalScrollIndicator = false;
    view1.showsHorizontalScrollIndicator = false;
    
    //内边距
    view1.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
    //弹簧效果
    view1.bounces = false;
    
    //代理/事件
    view1.delegate = self;
    
    //通过手势缩放图片
    //1. 设置缩放范围
    view1.minimumZoomScale = 0.1;
    view1.maximumZoomScale = 5;
    //2.
    
    self.myView = view1;
    
}

//设置要缩放的视图
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.img;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"开始拖拽 %@", NSStringFromCGPoint(self.myView.contentOffset));
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"结束拖拽 %@", NSStringFromCGPoint(self.myView.contentOffset));
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"拖拽中 %@", NSStringFromCGPoint(self.myView.contentOffset));
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"开始减速 %@", NSStringFromCGPoint(self.myView.contentOffset));
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"减速结束 %@", NSStringFromCGPoint(self.myView.contentOffset));
}


@end
