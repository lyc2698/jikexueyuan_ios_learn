//
//  studentModel.h
//  UsePlist
//
//  Created by admin on 16/6/2.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentModel : NSObject

@property(nonatomic, copy)NSString*name;
@property(nonatomic, copy)NSString*sex;
@property(nonatomic, assign)int age;
//朋友
@property(nonatomic, strong)studentModel*studentFriend;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)studentModelWithDict:(NSDictionary*)dict;


@end
