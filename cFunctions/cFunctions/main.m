//
//  main.m
//  cFunctions
//
//  Created by admin on 16/5/13.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        printHello("zhangsan");
        
        printf("max is %d\n", max(2, 3));
    }
    return 0;
}
