//
//  ViewController.m
//  calculate
//
//  Created by admin on 16/5/27.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input1;   //第一个输入框
@property (weak, nonatomic) IBOutlet UITextField *input2;   //第二个输入框
@property (weak, nonatomic) IBOutlet UIButton *add;         //加法
@property (weak, nonatomic) IBOutlet UIButton *sub;         //减法
@property (weak, nonatomic) IBOutlet UIButton *mul;         //乘法
@property (weak, nonatomic) IBOutlet UIButton *div;         //除法
@property (weak, nonatomic) IBOutlet UILabel *result;       //结果
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.add addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.sub addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.mul addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    [self.div addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)calc:(UIButton*)btn {
    //1. 获取输入
    NSString*strInput1 = self.input1.text;
    NSString*strInput2 = self.input2.text;
    //判断是否已输入
    if ([strInput1 isEqualToString:@""] || [strInput2 isEqualToString:@""]) {
        self.result.text = @"请填写完毕后再计算";
        return;
    }
    
    //2. 计算
    float fResult = 0;
    NSString*methodString = btn.titleLabel.text;
 
    if ([methodString isEqualToString:@"加"]) {
        fResult = [strInput1 floatValue] + [strInput2 floatValue];
    }else if ([methodString isEqualToString:@"减"]) {
        fResult = [strInput1 floatValue] - [strInput2 floatValue];
    }else if ([methodString isEqualToString:@"乘"]) {
        fResult = [strInput1 floatValue] * [strInput2 floatValue];
    }else if ([methodString isEqualToString:@"除"]) {
        if ([strInput2 isEqualToString:@"0"]) {
            self.result.text = @"除数不能为0";
            return;
        }
        fResult = [strInput1 floatValue] / [strInput2 floatValue];
    }
    
    //3. 显示结果
    self.result.text = [NSString stringWithFormat:@"%.02f", fResult];
}

@end
