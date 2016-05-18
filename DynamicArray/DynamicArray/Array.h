//
//  Array.h
//  DynamicArray
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#ifndef Array_h
#define Array_h

#include <stdio.h>
#include "Object.h"

typedef Object* AnyPointer;

/** 数组结构体. */
typedef struct Array_ {
    int length_;
    int capacity_;
    AnyPointer *values_;
} Array;

/** 创建数组. */
Array *ArrayCreate();
/** 获取数组长度. */
int ArrayGetLength(Array *arr);
/** 添加元素. */
void ArrayAdd(Array *arr, AnyPointer value);
/** 添加元素(可指定位置). */
void ArrayAddAt(Array *arr, AnyPointer value, int index);
/** 移除元素. */
void ArrayRemoveAt(Array *arr, int index);
/** 获取数组里某个元素值. */
AnyPointer ArrayGet(Array *arr, int index);
/** 删除数组. */
void ArrayDestory(Array *arr);

#endif /* Array_h */
