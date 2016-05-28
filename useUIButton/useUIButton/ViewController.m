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
//    UIButton *btn = [[UIButton alloc]init];
//    btn.frame = CGRectMake(0, 200, 150, 60);
//    btn.backgroundColor = [UIColor redColor];
//    [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateHighlighted];
//    [btn setTitle:@"默认" forState:UIControlStateNormal];
//    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
//    
//    [self.view addSubview:btn];
    
    
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
}

/** 设置禁用状态时候的图片. */
- (void)disableBtn:(UIButton*)btn {
    [self.myBtn setImage:[UIImage imageNamed:@"3.jpg"] forState:UIControlStateDisabled];
}

/** 设置普通状态时候的图片. */
- (void)normalBtn:(UIButton*)btn {
    [self.myBtn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    [self.myBtn setTitle:@"默认" forState: UIControlStateSelected];
}

@end
