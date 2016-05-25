//
//  Object.c
//  DynamicArray
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#include "Object.h"
#include <stdlib.h>


void ObjectRetain(Object *obj){
    obj->retainCount_++;
}

void ObjectRelease(Object *obj){
    obj->retainCount_--;
    
    if (obj->retainCount_ <= 0) {
        free(obj);
        
        printf("The Object is release\n");
    }
}


int ObjectRetainCount(Object *obj){
    return obj->retainCount_;
}


