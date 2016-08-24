//
//  ViewController.m
//  location2
//
//  Created by admin on 16/8/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic, strong)CLLocationManager*manager1;
@property(nonatomic, strong)CLGeocoder*coder;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        //发送授权请求
        [self.manager1 requestAlwaysAuthorization];
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
-(CLGeocoder*)coder
{
    if (_coder == nil) {
        _coder = [[CLGeocoder alloc]init];
    }
    return _coder;
}

//定位成功回调函数
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location1 = [locations lastObject];
    
    NSLog(@"定位成功 经度 = %f, 纬度 = %f", location1.coordinate.longitude, location1.coordinate.latitude);
    
    [self.coder reverseGeocodeLocation:location1 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error == nil) {
            //解析数据
            CLPlacemark *mark = [placemarks firstObject];
            NSDictionary *dict = [mark addressDictionary];
            NSLog(@"%@", dict[@"Name"]);
        }
    }];
    //停止定位
    [self.manager1 stopUpdatingLocation];
}

@end
