//
//  Integer.c
//  DynamicArray
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#include "Integer.h"
#include <stdlib.h>
#include "Object.h"

Integer *IntegerNew(int32_t value){
    Integer *ins = malloc(sizeof(Integer));
    ObjectRetain((Object *)ins);
    ins->value_ = value;
    return ins;
}

int32_t IntegerGet(Integer *ins){
    return ins->value_;
}
