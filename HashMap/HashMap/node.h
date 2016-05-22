//
//  node.h
//  HashMap
//
//  Created by admin on 16/5/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#ifndef node_h
#define node_h

#include <stdio.h>

/**
 * 链表节点
 */
typedef struct Node_ {
    char *key;
    char *value;
    struct Node_ *next;
} Node;

/** 创建链表. */
Node *nodeCreate(char *key, char *value);

/** hashCode 算法. */
unsigned int BKDRHash(char *str);

#endif /* node_h */
