//
//  main.m
//  cStrings
//
//  Created by admin on 16/5/14.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char *str1 = "hello";
        char *str2 = "world";
        
        char buf[100];
        memset(buf, 0, 100);
        
        strcat(buf, str1);
        strcat(buf, str2);
        
        printf("%s, length=%ld\n", buf, strlen(buf));
        
        sprintf(buf, "%s%s%d", str1, str2, 100);
        
        printf("%s\n", buf);
        
        //字符串转 int
        char *num = "100";
        int intVar = atoi(num);
        printf("%d\n", intVar);
    }
    return 0;
}
