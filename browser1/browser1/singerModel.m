//
//  singerModel.m
//  browser1
//
//  Created by admin on 16/6/11.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "singerModel.h"

@implementation singerModel



-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    if (self) {
        
        //使用 kvc
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)singerModelWithDict:(NSDictionary*)dict {
    return [[singerModel alloc]initWithDict:dict];
}

@end
