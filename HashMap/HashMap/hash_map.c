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

/** 获取 hashCode 的值. */
int hashGetHashCode(HashMap *hashMap, char *key){
    int index = BKDRHash(key) % hashMap->capacity_;
    printf("key=%s, index=%d\n", key, index);
    return index;
}

/** 创建 hashMap. */
HashMap *hashMapCreate(){
    HashMap *hashMap = malloc(sizeof(HashMap));
    hashMap->capacity_ = 128;
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
    if (oldNode == NULL) {
        hashMap->size_++;

        if (index >= hashMap->capacity_ * hashMap->load_factor_) {
            hashMapResize(hashMap);
        }
        
        hashMap->table[index] = node;
        OBJECT_RETAIN(node);
    }else{
       //遍历链表判断是否有这个 key, 如果有, 更新 value(如果 index 存在, 则 key 一定存在链表中)
        while (oldNode != NULL) {
            if (oldNode->key == node->key) {
                oldNode->value = node->value;
                break;
            }
            
            oldNode = oldNode->next;
        }
    }
    
}

/** 移除元素. */
void hashMapRemove(HashMap *hashMap, char *key){
    int index = hashGetHashCode(hashMap, key);
    Node *node = hashMap->table[index];
    
    //如果不存在此 node
    if (node == NULL){
        printf("没有此链表\n");
        return ;
    }
    
    //要删除的是头结点，那么直接head = NULL;
    if (node->key == key) {
        hashMap->table[index] = NULL;
        OBJECT_RELEASE(node);
    }else{
    
        for (Node* it = node,*prev = node; it != NULL;prev = it,it = it->next) {
            
            if (it->key == key) {
                // 目标节点的下一个节点不为null
                if (it->next) {
                    *it = *(it->next);
                    printf("removed\n");
                    OBJECT_RELEASE(it);
                }else {
                    // 目标节点是最后一个节点
                    prev->next = NULL;
                    printf("removed last\n");
                    OBJECT_RELEASE(it);
                }
                break;
            }
        }

    }

}

/** 获取元素. */
void hashMapGet(HashMap *hashMap, char *key){
    int index = hashGetHashCode(hashMap, key);
    
    for (Node *node = hashMap->table[index]; node != NULL; node = node->next) {
        if (node->key == key) {
            printf("查到, key:%s, value:%s\n", key, node->value);
            break;
        }
    }

}

/** 销毁hashMap. */
void hashMapDestory(HashMap *hashMap){
    //遍历整个 table
    for (int i = 0; i < (hashMap->capacity_ * hashMap->load_factor_); i++) {
        
        //如果 table 不为空
        if (hashMap->table[i] != NULL) {
            
            //遍历单链表并销毁 node
            for (Node *node = hashMap->table[i]; node != NULL; node = node ->next) {
                Node *temp = node;
                free(temp);
            }
        }
    }
    
    //销毁 hashMap
    free(hashMap);
    printf("hashMap 已销毁\n");
}

/** 打印hashMap. */
void hashMapPrint(HashMap *hashMap){
    printf("当前hashMap内容:\n");
    for (int i = 0; i < (hashMap->capacity_ * hashMap->load_factor_); i++) {
        if (hashMap->table[i] != NULL) {
            for (Node *node = hashMap->table[i]; node != NULL; node = node ->next) {
                 printf("%s:%s ", node->key, node->value);
            }
        }
    }
    printf("\n");
}

/** 调整hashMap大小. */
void hashMapResize(HashMap *hashMap){
    Node **oldNodes = hashMap->table;
    hashMap->capacity_ *= 2;
    memcpy(hashMap->table, oldNodes, sizeof(Node) * hashMap->capacity_);
    free(oldNodes);
}



