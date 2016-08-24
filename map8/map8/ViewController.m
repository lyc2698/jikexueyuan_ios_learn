//
//  ViewController.m
//  map8
//
//  Created by admin on 16/8/24.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "myView.h"

@interface ViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *address;
@property(nonatomic, strong)MKMapView*mapView;
@property(nonatomic, strong)CLLocationManager*locationManager;

@end

@implementation ViewController

//搜索
- (IBAction)go:(id)sender {
    
    CLGeocoder*coder = [[CLGeocoder alloc]init];
    [coder geocodeAddressString:self.address.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark*mark in placemarks) {
            NSDictionary*dict = mark.addressDictionary;
            
            NSLog(@"查找成功, 地址是: %@", dict[@"Name"]);
            
            //把地图中心点设置为输入的地址
            [self.mapView setCenterCoordinate:mark.location.coordinate];
            
            //设置地图显示区域
            [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(mark.location.coordinate, 1000, 1000)];
            
            //定义大头针
            MyAnnotation*annotation = [[MyAnnotation alloc]init];
            annotation.coordinate = mark.location.coordinate;
            annotation.title = dict[@"Name"];
            annotation.subtitle = @"这是子标题";
            
            //添加大头针
            [self.mapView addAnnotation:annotation];
        }
    }];
    
    //回收键盘
    [self.address resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    //跟踪用户位置
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}


-(MKMapView*)mapView
{
    if (!_mapView) {
        CGRect rect = self.view.bounds;
        rect.origin.y = 50;
        rect.size.height -= 50;
        
        _mapView = [[MKMapView alloc]initWithFrame:rect];
        _mapView.delegate = self;
        
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

-(CLLocationManager*)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
    }
    return _locationManager;
}

//定位用户位置成功
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocation* location = userLocation.location;
    CLGeocoder*coder = [[CLGeocoder alloc]init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark*mark = [placemarks lastObject];
        NSDictionary*dict = mark.addressDictionary;
        
        NSLog(@"地址是: %@", dict[@"Name"]);
        
        //定义大头针
        MyAnnotation*annotation = [[MyAnnotation alloc]init];
        annotation.coordinate = mark.location.coordinate;
//        annotation.title = dict[@"Name"];
//        annotation.subtitle = @"这是子标题";
        
        //添加大头针
        [self.mapView addAnnotation:annotation];
    }];
}

//自定义大头针
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    myView*myView1 = [[myView alloc]initWithFrame:CGRectMake(0, 0, 30, 15)];
//    
//    myView1.backgroundColor = [UIColor redColor];
//    
//    return myView1;
//}

@end
