//
//  main.m
//  OO
//
//  Created by admin on 16/5/20.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Hello *h = [[Hello alloc] init];
        [h sayHello];
        
        [Hello staticSayHello];
        
        [h sayHelloTo:@"zhangsan" theOther:@"lisi"];
       
    }
    return 0;
}
