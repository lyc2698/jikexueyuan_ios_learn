//
//  ViewController.m
//  useUIButton
//
//  Created by admin on 16/5/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *disableBtn;
@property (weak, nonatomic) IBOutlet UIButton *normalBtn;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建按钮
    UIButton *btn = [[UIButton alloc]init];
    //设置位置
    btn.frame = CGRectMake(10, 50, 150, 60);
    //设置字体颜色
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置图片内容
    [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateHighlighted];
    //设置文字内容
    [btn setTitle:@"默认" forState:UIControlStateNormal];
    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
    //设置文字和图片位置
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 50, 0, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -350, 0, 0)];
    //添加视图
    [self.view addSubview:btn];
    
    /** 按钮操作. */
    //设置选中状态时候的图片
    [self.selectBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    //设置禁用状态时候的图片
    [self.disableBtn addTarget:self action:@selector(disableBtn:) forControlEvents:UIControlEventTouchUpInside];
    //设置普通状态时候的图片
    [self.normalBtn addTarget:self action:@selector(normalBtn:) forControlEvents:UIControlEventTouchUpInside];
}


/** 设置选中状态时候的图片. */
- (void)selectBtn:(UIButton*)btn {
    [self.myBtn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateSelected];
    self.myBtn.enabled = YES;
    self.myBtn.selected = YES;
}

/** 设置禁用状态时候的图片. */
- (void)disableBtn:(UIButton*)btn {
    [self.myBtn setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateDisabled];
    self.myBtn.enabled = NO;
    self.myBtn.selected = NO;
}

/** 设置普通状态时候的图片. */
- (void)normalBtn:(UIButton*)btn {
    [self.myBtn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    self.myBtn.enabled = YES;
    self.myBtn.selected = NO;
}

@end
