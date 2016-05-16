//
//  main.m
//  cPointer
//
//  Created by admin on 16/5/14.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Student {
    int age;
    char *name;
};


int max(int a, int b) {
    return a > b ? a : b;
}

typedef int(*myFunction) (int, int);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        char *str = "hello world";
//        
//        printf("%c\n", *(str+1));
//        printf("%lld\n", (int64_t)str);
//        
//        int64_t strPointer = (int64_t)str;
//        
//        char *string = (char *)strPointer;
//        
//        printf("%s\n", string);
        
        /** 结构体指针. */
//        struct Student student = {18, "xiaojia"};
//        struct Student student1 = student;
//        student1.name = "xaaaa";
        
//        struct Student *student = malloc(sizeof(struct Student));
//        student->age = 18;
//        student->name = "xiaohua";
//        
//        struct Student *student1 = student;
//        student1->name = "hua";
//        
//        printf("name = %s\n", student->name);
//        
//        free(student);
        
        /** 函数指针. */
//        int(*p)(int, int);
//        p = &max;
        myFunction func = &max;
        
        int maxValue = func(2, 3);
        printf("%d\n", maxValue);
        
    }
    return 0;
}
