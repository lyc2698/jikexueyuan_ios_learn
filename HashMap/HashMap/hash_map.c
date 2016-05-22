//
//  hash_map.c
//  HashMap
//
//  Created by admin on 16/5/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#include <stdlib.h>
#include "hash_map.h"
#include "node.h"


int hashGetHashCode(HashMap *hashMap, char *key){
    return BKDRHash(key) % hashMap->capacity_;
}

/** 创建 hashMap. */
HashMap *hashMapCreate(){
    HashMap *hashMap = malloc(sizeof(HashMap));
    hashMap->capacity_ = 512;
    hashMap->load_factor_ = 0.75;
    hashMap->size_ = 0;
    hashMap->table = (Node **)malloc(sizeof(Node) * hashMap->capacity_);
    return hashMap;
}

/** 添加元素. */
void hashMapPut(HashMap *hashMap, Node *node){
    int index = hashGetHashCode(hashMap, node->key);
    Node *oldNode = hashMap->table[index];
    
    // 如果这个key在map中不存在，则插入到当前index中的头节点，同样返回null
    if (hashMap->table[index] == NULL) {
        node->next = oldNode;
        hashMap->size_++;
        //printf("size_=%d, capacity_=%d, load_factor_=%f\n", hashMap->size_, hashMap->capacity_, hashMap->load_factor_);
        if (index >= hashMap->capacity_ * hashMap->load_factor_) {
            hashMap->capacity_ *= 2;
            
            Node **oldNodes = hashMap->table;
            memcpy(hashMap->table, oldNodes, sizeof(Node) * hashMap->capacity_);
            free(oldNodes);
        }
    }
    
    hashMap->table[index] = node;
    
    
}

/** 移除元素. */
void hashMapRemove(HashMap *hashMap, char *key){
    int index = hashGetHashCode(hashMap, key);
    
}

/** 获取元素. */
void hashMapGet(HashMap *hashMap, char *key){

}

/** 销毁hashMap. */
void hashMapDestory(HashMap *hashMap){

}

/** 打印hashMap. */
void hashMapPrint(HashMap *hashMap){
    for (int i = 0; i < (hashMap->capacity_ * hashMap->load_factor_); i++) {
        if (hashMap->table[i] != NULL) {
            for (Node *node = hashMap->table[i]; node != NULL; node = node ->next) {
                printf("%s:%s\n", node->key, node->value);
            }
        }
    }
}



