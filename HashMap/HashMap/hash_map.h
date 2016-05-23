//
//  hash_map.h
//  HashMap
//
//  Created by admin on 16/5/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#ifndef hash_map_h
#define hash_map_h

#include <stdio.h>
#include "node.h"

/** hashMap 结构. */
typedef struct HashMap_ {
    int capacity_;        // map的初始容量
    int size_;            // 当前存储的键值对的数量
    float load_factor_;   //负载因子
    Node **table;        //单链表
} HashMap;


/** 获取 hashCode 值. */
int hashGetHashCode(HashMap *hashMap, char *key);

/** 创建 hashMap. */
HashMap *hashMapCreate();

/** 添加元素. */
void hashMapPut(HashMap *hashMap, Node *node);

/** 移除元素. */
void hashMapRemove(HashMap *hashMap, char *key);

/** 获取元素. */
void hashMapGet(HashMap *hashMap, char *key);

/** 销毁hashMap. */
void hashMapDestory(HashMap *hashMap);

/** 打印hashMap. */
void hashMapPrint(HashMap *hashMap);


#endif /* hash_map_h */
