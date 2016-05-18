//
//  main.m
//  DynamicArray
//
//  Created by admin on 16/5/16.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Array.h"
#include "Object.h"
#include "Student.h"

/** 创建8个学生元素并加入数组. */
void Create8Student(Array *arr){
    Student *student0 = StudentNew(20, "小明");
    ArrayAdd(arr, (Object *) student0);
    OBJECT_RELEASE(student0);
    Student *student1 = StudentNew(21, "大明");
    ArrayAdd(arr, (Object *) student1);
    OBJECT_RELEASE(student1);
    Student *student3 = StudentNew(22, "小李");
    ArrayAdd(arr, (Object *) student3);
    OBJECT_RELEASE(student3);
    Student *student4 = StudentNew(24, "小张");
    ArrayAdd(arr, (Object *) student4);
    OBJECT_RELEASE(student4);
    Student *student5 = StudentNew(28, "小马");
    ArrayAdd(arr, (Object *) student5);
    OBJECT_RELEASE(student5);
    Student *student6 = StudentNew(29, "小陈");
    ArrayAdd(arr, (Object *) student6);
    OBJECT_RELEASE(student6);
    Student *student7 = StudentNew(25, "小蔡");
    ArrayAdd(arr, (Object *) student7);
    OBJECT_RELEASE(student7);
    Student *student8 = StudentNew(26, "小王");
    ArrayAdd(arr, (Object *) student8);
    OBJECT_RELEASE(student8);
}

/** 打印学生数组. */
void printStudentArray(Array *studentArray){
    for (int j = 0; j < ArrayGetLength(studentArray); j++) {
        printf("位置: %d, 名字: %s, 年龄: %d\n",
               j + 1,
               StudentGetName((Student *)ArrayGet(studentArray, j)),
               StudentGetAge((Student *)ArrayGet(studentArray, j)));
    }
    printf("\n");
}

/** 打印学生元素. */
void printStudent(Student *student){
    printf("他是: %s, 年龄: %d\n",
           StudentGetName(student),
           StudentGetAge(student));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Array *studentArray = ArrayCreate();
        
        printf("数组创建后插入几个元素:\n");
        Create8Student(studentArray);
        printStudentArray(studentArray);
        
        printf("把小李删掉再打印一遍, (删除元素)\n");
        ArrayRemoveAt(studentArray, 2);
        printStudentArray(studentArray);
        
        printf("欢迎老王, (指定位置插入元素)\n");
        Student *studentWang = StudentNew(50, "老王");
        ArrayAddAt(studentArray, (Object *)studentWang, 5);
        OBJECT_RELEASE(studentWang);
        printStudentArray(studentArray);
        
        printf("第二个人是谁? (查询元素)\n");
        Student *studentGetResult = (Student *)ArrayGet(studentArray, 1);
        printStudent(studentGetResult);
        
        printf("把数组销毁\n");
        ArrayDestory(studentArray);
        
    }
    return 0;
}
