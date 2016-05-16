//
//  main.m
//  cStruct
//
//  Created by admin on 16/5/14.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    int age;
    char *name;
} Student;

union Data {
    char ch;
    int8_t value;
};

struct ColorS {
    uint8_t blue, green, red, alpha;
};

union ColorU {
    int32_t color;
    struct ColorS colors;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //        NSLog(@"Hello, World!");
        
//        struct Student s = {10, "jikexueyuan"};
//        Student s;
//        s.age = 10;
//        s.name = "jike";
//        
//        printf("name=%d\n", s.age);
//        
//        union Data data = {'C'};
//        printf("%c\n", data.ch);
//        printf("%d\n", data.value);
        
        int32_t color = 0xFFFF0000;
        
        union ColorU theColor;
        theColor.color = color;
        
        printf("%x\n", theColor.colors.green);
    }
    return 0;
}