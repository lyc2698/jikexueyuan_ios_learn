//
//  ViewController.m
//  useUIImageView
//
//  Created by admin on 16/6/1.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UISlider 控件
    [self.mySlider addTarget:self action:@selector(slider) forControlEvents:UIControlEventValueChanged];
    
    //UISwitch 控件
    [self.mySwitch addTarget:self action:@selector(switchFun) forControlEvents:UIControlEventTouchUpInside];
    
    //代码创建 UIImageView
    [self createUIImageView];
}

/** 创建 UIImageView 并加载到视图中. */
-(void)createUIImageView{
    UIImageView*image = [[UIImageView alloc]initWithFrame:CGRectMake(33, 350, 200, 100)];
    
    [image setImage:[UIImage imageNamed:@"2.png"]];
    image.backgroundColor = [UIColor blueColor];
    image.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:image];
}

/** slider 操作. */
-(void)slider {
    self.myImage.alpha = self.mySlider.value / 100;
}

/** switch 操作. */
-(void)switchFun {
    if (self.mySwitch.isOn) {
        self.mySlider.enabled = YES;
    }else{
        self.mySlider.enabled = NO;
    }
}

@end
