//
//  main.m
//  CTypes
//
//  Created by admin on 16/5/4.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
//        int32_t a = 10;
//        int64_t b = 100;
//        printf("a = %d, b = %lld", a, b);
        
        //浮点数
//        Float32 f = 3.14;
//        Float64 d = 3.14;
//        printf("f = %f, d = %f", f, d);
        
        //字符
//        char ch = 'A';
//        printf("ch = %c", ch + 32);
        
        //字符串
//        char *str = "hello World";
//        printf("str = %s\n", str);
//        printf("str first = %c", str[0]);

        //数组
//        int32_t intArr[10];
//        memset(intArr, 0, 10);
//        intArr[0] = 1;
//        intArr[4] = 10;
//        printf("%d\t", intArr[1]);
//        printf("%d", intArr[4]);
        
        char str[10];
        memset(str, 0, 10);
        str[0] = 'H';
        str[5] = 'l';
        printf("%s", str);
        
        printf("\n");
    }
    return 0;
}
