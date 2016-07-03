//
//  ViewController.m
//  File
//
//  Created by admin on 16/7/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)NSUserDefaults *manger;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /** 获取沙盒根目录. */
    NSString *strHome = NSHomeDirectory();
    NSLog(strHome, nil);

    /** 获取沙盒 doc目录. */
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(strDoc, nil);
    
    /** 获取沙盒 doc目录. */
    NSString *strLib = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(strLib, nil);
    
    /** 获取 tmp 目录. */
    NSString *strTmp = NSTemporaryDirectory();
    NSLog(strTmp, nil);
    
    _manger = [NSUserDefaults standardUserDefaults];
}

/** 读取. */
- (IBAction)read:(id)sender {
    /** 获取沙盒 doc目录. */
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    strDoc = [strDoc stringByAppendingString:@"/test.plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:strDoc];
    NSLog(@"%@", dict);
}

/** 写入. */
- (IBAction)write:(id)sender {
    /** 获取沙盒 doc目录. */
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    strDoc = [strDoc stringByAppendingString:@"/test.plist"];
    
    //获取文件管理单例对象
    NSFileManager *manger = [NSFileManager defaultManager];
    Boolean isExist = [manger fileExistsAtPath:strDoc];
    if (!isExist) {
        NSDictionary *dict = @{@"company": @"jkxy", @"teacher": @"lys"};
        [dict writeToFile:strDoc atomically:YES];
        NSLog(@"写入文件成功");
    } else {
        NSLog(@"文件已存在");
    }
}

- (IBAction)createDir:(id)sender {
    NSFileManager *manger = [NSFileManager defaultManager];
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    strDoc = [strDoc stringByAppendingString:@"/abc"];
    
    [manger createDirectoryAtPath:strDoc withIntermediateDirectories:YES attributes:nil error:nil];
}
- (IBAction)createFile:(id)sender {
    NSFileManager *manger = [NSFileManager defaultManager];
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    strDoc = [strDoc stringByAppendingString:@"/abcd"];
    
    [manger createFileAtPath:strDoc contents:nil attributes:nil];
}
- (IBAction)delDir:(id)sender {
    NSFileManager *manger = [NSFileManager defaultManager];
    NSString *strDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    strDoc = [strDoc stringByAppendingString:@"/abc"];
    
    [manger removeItemAtPath:strDoc error:nil];
}
- (IBAction)save:(id)sender {
    
    [_manger setValue:@"Jiexueyuan" forKey:@"name"];
    [_manger setInteger:18 forKey:@"age"];
}
- (IBAction)use:(id)sender {
    
    NSLog(@"%@", [_manger valueForKey:@"name"]);
    NSLog(@"%d", [_manger integerForKey:@"age"]);
}


@end
