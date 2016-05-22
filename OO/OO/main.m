//
//  main.m
//  OO
//
//  Created by admin on 16/5/20.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hello : NSObject

-(void)sayHello;

@end

@implementation Hello

-(void)sayHello{
     NSLog(@"Hello, World!");
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Hello *h = [[Hello alloc] init];
        [h sayHello];
       
    }
    return 0;
}
