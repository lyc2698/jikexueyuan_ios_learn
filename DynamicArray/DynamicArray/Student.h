//
//  Student.h
//  DynamicArray
//
//  Created by admin on 16/5/18.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#ifndef Student_h
#define Student_h

#include <stdio.h>


typedef struct Student_ {
    int retainCount_;
    int age_;
    char *name_;
} Student;

Student *StudentNew(int age, char *name);
int StudentGetAge(Student *student);
char *StudentGetName(Student *student);

#endif /* Student_h */
