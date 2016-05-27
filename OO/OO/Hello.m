//
//  Hello.m
//  OO
//
//  Created by admin on 16/5/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "Hello.h"

@implementation Hello

+(void)staticSayHello{
    NSLog(@"Hello, static");
}
-(void)sayHello{
    NSLog(@"Hello, World!");
}
-(void)sayHelloTo:(NSString *)name theOther:(NSString *)name1{
    NSLog(@"Hello, %@, %@", name, name1);
//    [self sayHello];
}
@end
