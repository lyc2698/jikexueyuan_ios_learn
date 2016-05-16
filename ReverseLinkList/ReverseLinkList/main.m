//
//  main.m
//  ReverseLinkList
//
//  Created by admin on 16/5/16.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 链表节点
 */
typedef struct Node_ {
    int value;
    struct Node_ *next;
} Node;

/**
 * 创建 10个节点
 */
Node *createNode() {
    Node *first = NULL;

    for (int i = 9; i >= 0; i--) {
        Node *node = malloc(sizeof(Node));
        node->value = i;
        node->next = first;
        first = node;
    }
    return first;
}

/**
 * 反转链表
 */
Node *reverseNode(Node *first){
    Node *newFirst = NULL;
    Node *pre = NULL;
    Node *current = first;
    
    while (current != NULL) {
        Node *tmp = current->next;
        
        if (tmp == NULL) {
            newFirst = current;
        }
        current->next = pre;
        pre = current;
        current = tmp;
    }
    return newFirst;
}

/**
 * 打印
 */
void printList(Node *node) {
    while(node != NULL) {
        printf("current node value is %d\n", node->value);
        node = node->next;
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Node *current = createNode();
        printList(current);
        printf("反转链表\n");
        Node *new = reverseNode(current);
        printList(new);
        
    }
    return 0;
}
