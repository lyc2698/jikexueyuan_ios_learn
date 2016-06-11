//
//  studentModel.m
//  UsePlist
//
//  Created by admin on 16/6/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "studentModel.h"

@implementation studentModel


-(instancetype)initWithDict:(NSDictionary*)dict {
    //父类初始化
    self = [super init];
    
    //子类初始化
    
    if (self) {
//        self.name = dict[@"name"];
//        self.sex = dict[@"sex"];
//        self.age = [dict[@"age"] intValue];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)studentModelWithDict:(NSDictionary*)dict {
    return [[studentModel alloc]initWithDict:dict];
}

@end
