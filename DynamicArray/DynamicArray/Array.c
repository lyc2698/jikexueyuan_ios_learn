//
//  Array.c
//  DynamicArray
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#include "Array.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>

static AnyPointer *allocMemoryByCapacity(Array *arr){
    return malloc(sizeof(AnyPointer) * arr->capacity_);
}

Array *ArrayCreate(){
    Array *arr = malloc(sizeof(Array));
    arr->length_ = 0;
    arr->capacity_ = 32;
    arr->values_ = allocMemoryByCapacity(arr);
    return arr;
}


int ArrayGetLength(Array *arr){
    return arr->length_;
}


void ArrayAdd(Array *arr, AnyPointer value){
    if (arr->length_ >= arr->capacity_) {
        arr->capacity_ *= 2;
        AnyPointer *oldValues = arr->values_;
        arr->values_ = allocMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, arr->length_*sizeof(AnyPointer));
        free(oldValues);
    }
    
    arr->values_[arr->length_] = value;
    arr->length_ += 1;
    
    OBJECT_RETAIN(value);
}

void ArrayAddAt(Array *arr, AnyPointer value, int index){
    if (arr->length_ >= arr->capacity_) {
        arr->capacity_ *= 2;
        AnyPointer *oldValues = arr->values_;
        arr->values_ = allocMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, arr->length_*sizeof(AnyPointer));
        free(oldValues);
    }
    arr->length_ += 1;
    
    //在 index 后的元素都后移
    for (int i = index; i < arr->length_; i++) {
        arr->values_[i + 1] = arr->values_[i];
    }
    
    arr->values_[index] = value;
    
    OBJECT_RETAIN(value);
}


AnyPointer ArrayGet(Array *arr, int index){
    assert(index >= 0 && index < arr->length_);
    return arr->values_[index];
}


void ArrayDestory(Array *arr){
    free(arr->values_);
    free(arr);
    printf("array was destoryed\n");
}


void ArrayRemoveAt(Array *arr, int index){
    assert(index >= 0 && index < arr->length_);
    
    OBJECT_RELEASE(ArrayGet(arr, index));
    arr->length_--;
    for (int i = index; i < arr->length_; i++) {
        arr->values_[i] = arr->values_[i+1];
    }
}





