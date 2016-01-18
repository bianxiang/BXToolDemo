//
//  YXTabbar.m
//  zs
//
//  Created by administrator on 15/11/3.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import "YXTabbar.h"
#import "YXItem.h"
#define kImgCount 5

@interface YXTabbar()
{
    NSArray *_titleArr;
    NSArray *_normalImgArr;
    NSArray *_selectedImgArr;
    
    YXItem  *_previousItem;
}
@end

@implementation YXTabbar

- (instancetype)initWithFrame:(CGRect)frame backgroundImg:(UIImage *)img titleArr:(NSArray *)titleArr normalImgArr:(NSArray *)normalImgArr selectedImgArr:(NSArray *)selectedImgArr {
    if (self = [super initWithFrame:frame]) {
        // 将图片转换成颜色
        self.backgroundColor = [UIColor colorWithPatternImage:img];
        _titleArr = titleArr;
        _normalImgArr = normalImgArr;
        _selectedImgArr = selectedImgArr;
        
        // 添加tabbar上的元素项
        [self addItems];
    }
    
    return self;
}

#pragma mark 添加所有按钮
- (void)addItems {
    // 循环创建所有元素项
  
    CGFloat w = LFScreenWidth/ kImgCount;
    CGFloat h = self.bounds.size.height;
    NSLog(@"%f",h);
    
    for (int i = 0; i < kImgCount; i ++) {
        YXItem *item = [YXItem itemWithFrame:CGRectMake(i * w, 0, w, h) tag:i normalImg:[_normalImgArr[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImg:[_selectedImgArr[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:_titleArr[i] titleColor:[UIColor whiteColor]];
        
        
        [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:item];
        
        if (0 == i) [self itemClicked:item];
    }
}

- (void)itemClicked:(YXItem *)item {
    
    
    //    if (item.tag!=3) {
    //        for (YXItem *item in self.subviews) {
    //            if (item.tag==3) {
    //                item.selected = NO;
    //            }
    //        }
    _previousItem.selected = NO;
    item.selected = YES;
    _previousItem = item;
    //    }
    //    if (item.tag==3&&[LFTool boolForKey:LF_IsLogin]) {
    //        _previousItem.selected = NO;
    //        item.selected = YES;
    //        _previousItem = item;
    //    }
    
    
    if (_block) {
        _block(item.tag);
    }
}


@end

