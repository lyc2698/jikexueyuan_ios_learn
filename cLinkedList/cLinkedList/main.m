//
//  main.m
//  cLinkedList
//
//  Created by admin on 16/5/14.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct NOde_{
    int value;
    struct Node_ *next;
    struct NOde_ *pre;
} Node;


Node *createNode(int value, Node *pre, Node *next){
    Node *node = malloc(sizeof(Node));
    node->value = value;
    
    if (next != NULL) {
        next->pre = node;
    }
    
    if (pre != NULL) {
        pre->next = node;
    }
    return node;
}

void printList(Node *firstNode){
    for (Node *node = firstNode; node != NULL; node = node->next) {
        printf("current value %d\n", node->value);
    }
}

void rprintList(Node *end){
    for (Node *node = end; node != NULL; node = node->pre) {
        printf("curr value is %d\n", node->value);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        Node *first = createNode(0, NULL, NULL);
        Node *end = first;
        
        end = createNode(1, end, NULL);
        end = createNode(2, end, NULL);
        first = createNode(-1, NULL, first);
        
        rprintList(end);

    }
    return 0;
}
