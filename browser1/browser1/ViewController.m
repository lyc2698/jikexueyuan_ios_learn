//
//  ViewController.m
//  browser1
//
//  Created by admin on 16/6/11.
//  Copyright © 2016年 yicheng. All rights reserved.
//

#import "ViewController.h"
#import "singerModel.h"

@interface ViewController ()

//保存 plist 文件读出来的所有模型
@property(nonatomic, strong)NSMutableArray*arrayAll;

//显示歌手名称的label
@property(nonatomic, strong)UILabel*titleLabel;
//显示歌手图片的imageView
@property(nonatomic, strong)UIImageView*imageView;
//上一张按钮
@property(nonatomic, strong)UIButton*btnBack;
//下一张按钮
@property(nonatomic, strong)UIButton*btnNext;
//当前是第一张
@property(nonatomic, assign)int iIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showCurrentPage:0];
}

#pragma mark 创建标题 label
-(UILabel*)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 80, 200, 30)];
        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_titleLabel];
    }
    return _titleLabel;
}

#pragma mark 创建 imageView
-(UIImageView*)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 135, 200, 260)];
        _imageView.backgroundColor = [UIColor blueColor];
//        _imageView.center = self.view.center;
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark 创建"上一张"按钮
-(UIButton*)btnBack {
    if (_btnBack == nil) {
        _btnBack = [[UIButton alloc]initWithFrame:CGRectMake(60, 420, 80, 40)];
        _btnBack.backgroundColor = [UIColor blueColor];
        [_btnBack setTitle:@"上一张" forState: UIControlStateNormal];
        [_btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnBack];
    }
    return _btnBack;
}

#pragma mark 创建"下一张"按钮
-(UIButton*)btnNext {
    if (!_btnNext) {
        _btnNext = [[UIButton alloc]initWithFrame:CGRectMake(180, 420, 80, 40)];
        _btnNext.backgroundColor = [UIColor blueColor];
        [_btnNext setTitle:@"下一张" forState: UIControlStateNormal];
        [_btnNext addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnNext];
    }
    return _btnNext;
}

#pragma mark 上一张操作
-(void)back {
    
    if (self.iIndex > 0) {
        self.iIndex--;
        
        [self showCurrentPage:_iIndex];
    }
}

#pragma mark 下一张操作
-(void)next {
    
    if (self.iIndex < self.arrayAll.count - 1) {
        self.iIndex++;
        
        [self showCurrentPage:_iIndex];
    }
}

#pragma mark 显示当前页
-(void)showCurrentPage:(int) iPage {
    if (iPage >= 0 || iPage < self.arrayAll.count) {
        
        singerModel*model = self.arrayAll[iPage];
        
        //标题文字
        NSString*strTitle = [NSString stringWithFormat:@"%@ %d/%ld", model.name, iPage + 1, self.arrayAll.count];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = strTitle;
        
        //图片
        [self.imageView setImage:[UIImage imageNamed:model.pic]];
        
        //如果当前页是第一张
        if (iPage == 0) {
            [self btnDisable:self.btnBack];
        }else {
            [self btnActive: self.btnBack];
        }
        
        //如果当前页是最后一张
        if (iPage == self.arrayAll.count - 1) {
            [self btnDisable:self.btnNext];
        }else {
            [self btnActive:self.btnNext];
        }
    }
}

/** 把按钮设置为活动状. */
-(UIButton*)btnActive:(UIButton*)btn {
    btn.enabled = YES;
    btn.backgroundColor = [UIColor blueColor];
    return btn;
}

/** 把按钮设置为不可用状态. */
-(UIButton*)btnDisable:(UIButton*)btn {
    btn.enabled = NO;
    btn.backgroundColor = [UIColor grayColor];
    return btn;
}



/** plist 文件数据懒加载. */
-(NSMutableArray*)arrayAll {
    if (!_arrayAll) {
        //初始化
        _arrayAll = [NSMutableArray array];
        
        NSString*strPath = [[NSBundle mainBundle]pathForResource:@"picList.plist" ofType:nil];
        
        NSArray*array = [NSArray arrayWithContentsOfFile:strPath];
        
        for (NSDictionary*dict in array) {
            singerModel*model = [singerModel singerModelWithDict:dict];
            [_arrayAll addObject:model];
        }
    }
    
    return _arrayAll;
}



@end
