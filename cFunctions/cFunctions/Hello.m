//
//  Hello.m
//  cFunctions
//
//  Created by admin on 16/5/13.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Hello.h"

void printHello(char *str){
    printf("Hello OC %s\n", str);
}

int max(int a, int b){
    return a > b ? a : b;
}