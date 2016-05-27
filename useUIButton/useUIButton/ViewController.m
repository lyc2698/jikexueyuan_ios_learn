//
//  ViewController.m
//  useUIButton
//
//  Created by admin on 16/5/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建按钮
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
