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
        
        hashMapPut(hashMap, node1);
        hashMapPut(hashMap, node2);
        hashMapPrint(hashMap);
        
        printf("sss");
    }
    return 0;
}
