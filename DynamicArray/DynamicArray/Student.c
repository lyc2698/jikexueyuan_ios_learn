//
//  Student.c
//  DynamicArray
//
//  Created by admin on 16/5/18.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#include "Student.h"
#include <stdlib.h>
#include "Object.h"

Student *StudentNew(int age, char *name){
    Student *student = malloc(sizeof(Student));
    ObjectRetain((Object *)student);
    student->age_ = age;
    student->name_ = name;
    
    return student;
}


int StudentGetAge(Student *student){
    return student->age_;
}

char *StudentGetName(Student *student){
    return student->name_;
}