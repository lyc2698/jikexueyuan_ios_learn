//
//  ProgressView.m
//  Download
//
//  Created by admin on 16/6/19.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView()

@property(nonatomic, strong) CALayer *progressLayer;
@property(nonatomic, assign) CGFloat currentViewWidth;

@end

@implementation ProgressView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.progressLayer = [CALayer layer];
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        
        self.currentViewWidth = frame.size.width;
    }
    return self;
}

@synthesize progress = _progress;
-(void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    if (progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    }else if (progress <= 1) {
        self.progressLayer.frame = CGRectMake(0,
                                              0,
                                              progress * self.currentViewWidth,
                                              self.frame.size.height);
    }else {
        self.progressLayer.frame = CGRectMake(0,
                                              0,
                                              self.currentViewWidth,
                                              self.frame.size.height);
    }
}

-(CGFloat) progress {
    return _progress;
}

@end
