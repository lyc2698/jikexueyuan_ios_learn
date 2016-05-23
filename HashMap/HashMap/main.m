//
//  main.m
//  HashMap
//
//  Created by admin on 16/5/22.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "hash_map.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        HashMap *hashMap = hashMapCreate();
        
        Node *node1 = nodeCreate("name", "小明");
        Node *node2 = nodeCreate("age", "18");
        
        //添加
        printf("\n添加:\n");
        hashMapPut(hashMap, node1);
        hashMapPut(hashMap, node2);
        hashMapPrint(hashMap);
        
        //删除
        printf("\n删除:\n");
        hashMapRemove(hashMap, "age");
        hashMapPrint(hashMap);
        
        //查询
        printf("\n查询:\n");
        hashMapGet(hashMap, "age");
        hashMapPrint(hashMap);
        
        //销毁
        printf("\n销毁:\n");
        hashMapDestory(hashMap);
        hashMapPrint(hashMap);
    }
    return 0;
}
