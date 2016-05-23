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
    Node *node = hashMap->table[index];
    
    //如果不存在此 node
    if (node == NULL){
        printf("没有此链表\n");
        return ;
    }
    
    //遍历链表(有该 key 则删除)
    Node *head = node;
    Node *delNode = NULL;
    while (node->key != key && node != NULL) {
        delNode = node;
        node = node->next;
    }
    
    if (node->key != key) {
        printf("链表里没有这个 key\n");
    }
    
    if (node == head) {
        head = node->next;
    }else{
        delNode->next = node->next;
    }
    
    free(node);
    node = NULL;

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
            //销毁 table
            free(hashMap->table[i]);
        }
    }
    
    //销毁 hashMap
    free(hashMap);
    printf("hashMap 已销毁\n");
}

/** 打印hashMap. */
void hashMapPrint(HashMap *hashMap){
    for (int i = 0; i < (hashMap->capacity_ * hashMap->load_factor_); i++) {
        if (hashMap->table[i] != NULL) {
            for (Node *node = hashMap->table[i]; node != NULL; node = node ->next) {
                printf("当前hashMap内容: %s:%s\n", node->key, node->value);
            }
        }
    }
}



