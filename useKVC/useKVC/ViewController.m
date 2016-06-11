//
//  ViewController.m
//  useKVC
//
//  Created by admin on 16/6/10.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import "studentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    studentModel*student = [[studentModel alloc]init];
    studentModel*student2 = [[studentModel alloc]init];
    
    student.name = @"战三";
    student.sex = @"男";
    student.age = 19;
    
    NSLog(@"%@ %@ %d", student.name, student.sex, student.age);
    
    [student setValue:@"张三" forKey:@"name"];
    
    
    NSLog(@"%@ %@ %d", [student valueForKey:@"name"], student.sex, student.age);
    
    [student setValue:student2 forKey:@"studentFriend"];
    [student setValue:@"李四" forKeyPath:@"studentFriend.name"];
    NSLog(@"%@", [student valueForKeyPath:@"studentFriend.name"]);
     */
    
    //1. 获取路径
    NSString*strPath = [[NSBundle mainBundle]pathForResource:@"student.plist" ofType:nil];
    
    //2. 读取文件
    NSArray*arr = [NSArray arrayWithContentsOfFile:strPath];
    
    //3. 解析数据
    for (NSDictionary*dict in arr) {
        
        studentModel *model = [studentModel studentModelWithDict:dict];
        
        NSDictionary*dictTest = [model dictionaryWithValuesForKeys:@[@"name", @"sex"]];
//        dict writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>
        
        NSLog(@"%@, %@, %d", model.name, model.sex, model.age);
    }
}

@end
