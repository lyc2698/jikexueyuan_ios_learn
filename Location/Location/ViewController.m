//
//  ViewController.m
//  Location
//
//  Created by admin on 16/8/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic, strong)CLLocationManager*manager1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //获取程序的定位授权状态
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusNotDetermined) {
        //发送授权请求
        [self.manager1 requestLocation];
    }else if (status == kCLAuthorizationStatusAuthorizedAlways)
    {
        self.manager1.delegate = self;
        //开始定位
        [self.manager1 startUpdatingLocation];
    }

}

-(CLLocationManager*)manager1
{
    if (_manager1 == nil) {
        _manager1 = [[CLLocationManager alloc]init];
    }
    
    return _manager1;
}

//定位成功回调函数
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//    NSLog(@"定位成功");
//}
@end
