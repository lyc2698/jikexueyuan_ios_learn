//
//  ViewController.m
//  UsePlist
//
//  Created by admin on 16/6/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import "studentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 获取路径
    NSString*strPath = [[NSBundle mainBundle]pathForResource:@"student.plist" ofType:nil];
    
    //2. 读取文件
    NSArray*arr = [NSArray arrayWithContentsOfFile:strPath];
    
    //3. 解析数据
    for (NSDictionary*dict in arr) {
//        NSString*name = [dict objectForKey:@"name"];
//        NSString*sex = [dict objectForKey:@"sex"];
//        NSNumber*age = [dict objectForKey:@"age"];
        
        studentModel *model = [studentModel studentModelWithDict:dict];
        
        NSLog(@"%@, %@, %d", model.name, model.sex, model.age);
    }
}


@end
