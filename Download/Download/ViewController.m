//
//  ViewController.m
//  Download
//
//  Created by admin on 16/6/19.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()

@property(nonatomic, strong) ProgressView *progressView;
@property(nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressView = [[ProgressView alloc]initWithFrame:CGRectMake(20, 20, 290, 3)];
    
    [self.view addSubview:self.progressView];
    
    [self performSelector:@selector(layerAnimation)
               withObject:nil
               afterDelay:3.f];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(layerAnimation)
                                                userInfo:nil
                                                 repeats:YES];
}



-(void)layerAnimation {
    self.progressView.progress = arc4random() % 100 / 100.f;
}

@end
