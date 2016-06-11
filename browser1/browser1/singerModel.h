//
//  singerModel.h
//  browser1
//
//  Created by admin on 16/6/11.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singerModel : NSObject

//歌手
@property(nonatomic, copy)NSString*name;
//歌曲名
@property(nonatomic, copy)NSString*songname;
//图片名
@property(nonatomic, copy)NSString*pic;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)singerModelWithDict:(NSDictionary*)dict;



@end
