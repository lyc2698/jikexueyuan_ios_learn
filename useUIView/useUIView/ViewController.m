//
//  ViewController.m
//  useUIView
//
//  Created by admin on 16/5/27.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *blueView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printPosition:_yellowView viewName:@"yellowView"];
    [self printPosition:_blackView viewName:@"blackView"];
    [self printPosition:_redView viewName:@"redView"];
    
    [self printPosition:_greenView viewName:@"greenView"];
    [self printPosition:_blueView viewName:@"blueView"];
    
}

/** 打印frame, bounds, center 信息. */
-(void)printPosition:(UIView *)view viewName:(NSString *)name {
    NSLog(@"%@ frame = %@", name, NSStringFromCGRect(view.frame));
    NSLog(@"%@ bounds = %@", name, NSStringFromCGRect(view.bounds));
    NSLog(@"%@ center = %@", name, NSStringFromCGPoint(view.center));
}

@end
