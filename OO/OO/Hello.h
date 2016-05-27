//
//  Hello.h
//  OO
//
//  Created by admin on 16/5/28.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hello : NSObject

+(void)staticSayHello;
-(void)sayHello;
-(void)sayHelloTo:(NSString *)name theOther:(NSString *)name1;

@end
