//
//  Integer.h
//  DynamicArray
//
//  Created by admin on 16/5/17.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#ifndef Integer_h
#define Integer_h

#include <stdio.h>

typedef struct Integer_{
    int retainCount_;
    int32_t value_;
} Integer;

Integer *IntegerNew(int32_t value);
int32_t IntegerGet(Integer *ins);

#endif /* Integer_h */
