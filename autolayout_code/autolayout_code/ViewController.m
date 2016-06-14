//
//  ViewController.m
//  autolayout_code
//
//  Created by admin on 16/6/14.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1. 添加 view 到父窗口上
    UIView*redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView*yellowView = [[UIView alloc]init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView*blackView = [[UIView alloc]init];
    blackView.backgroundColor = [UIColor blackColor];
    [redView addSubview:blackView];
    
    
    //2. 禁用 autoresizing 功能
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    blackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //3. 创建约束
    //设置redView和yellowView: 左右间距20,宽带相等,上下对齐
    NSArray*arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-[yellowView(==redView)]-20-|" options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:@{@"redView": redView, @"yellowView": yellowView}];
    [self.view addConstraints:arrH];
    
    //设置redView: 上边距为40, 宽度200
    NSArray*arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[redView(==200)]-|" options:0 metrics:nil views:@{@"redView": redView}];
    [self.view addConstraints:arrV];
    
    //设置blackView: 距离父视图redView左边距为0
    NSArray*blackH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blackView]-|" options:0 metrics:nil views:@{@"blackView": blackView}];
    [redView addConstraints:blackH];
    
    //设置blackView: 距离父视图redView上边距为0
    NSArray*blackV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blackView]-|" options:0 metrics:nil views:@{@"blackView": blackView}];
    [redView addConstraints:blackV];
    
    //设置blackView: 宽度是父视图redView的0.5倍
    NSLayoutConstraint *blackWidth = [NSLayoutConstraint
                                      constraintWithItem:blackView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:redView
                                      attribute:NSLayoutAttributeWidth
                                      multiplier:0.5
                                      constant:0.0];
    [redView addConstraint:blackWidth];
    
    //设置blackView: 高度是父视图redView的0.5倍
    NSLayoutConstraint *blackHeight = [NSLayoutConstraint
                                      constraintWithItem:blackView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:redView
                                      attribute:NSLayoutAttributeHeight
                                      multiplier:0.5
                                      constant:0.0];
    [redView addConstraint:blackHeight];
}


@end
