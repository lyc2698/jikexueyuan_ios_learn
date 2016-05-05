//
//  main.m
//  PrimeNumber
//
//  Created by admin on 16/5/5.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        /**
         *在控制台输出0到100万之间的所有素数
         */
        for (int32_t i = 2; i <= 1000000; i++) {
            
            //被整除的标识, 0表示不能被1或自己本身整除, 1表示可以
            int32_t flag = 0;
            
            //不能被小于它的平方根的所有数字整除
            for (int32_t j = 2; j <= (int)sqrt(i); j++) {
                //如果能被整除, 标识为1
                if (i % j == 0) {
                    flag = 1;
                    break;
                }
            }
            
            //如果没有被整除, 说明是素数, 打印出来
            if (flag == 0) {
                printf("%d\n", i);
            }
        }
    }
    return 0;
}
