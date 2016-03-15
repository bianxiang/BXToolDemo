//
//  BXTabbar.m
//  DaiTou
//
//  Created by bianxiang on 16/3/15.
//  Copyright © 2016年 bianxiang. All rights reserved.
//

#import "BXTabbar.h"
#import "BXItem.h"
#define kImgCount 5

@interface BXTabbar()
{
    NSArray *_titleArr;
    NSArray *_normalImgArr;
    NSArray *_selectedImgArr;
    
    BXItem  *_previousItem;
}
@end

@implementation BXTabbar

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
    
    CGFloat w = SCREENWIDTH / kImgCount;
    CGFloat h = self.bounds.size.height;
    NSLog(@"%f",h);
    
    for (int i = 0; i < kImgCount; i ++) {
        BXItem *item = [BXItem itemWithFrame:CGRectMake(i * w, 0, w, h) tag:i normalImg:[_normalImgArr[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImg:[_selectedImgArr[i] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:_titleArr[i] titleColor:[UIColor whiteColor]];
        
        
        [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:item];
        
        if (0 == i) [self itemClicked:item];
    }
}

- (void)itemClicked:(BXItem *)item {

    _previousItem.selected = NO;
    item.selected = YES;
    _previousItem = item;
 
    
    
    if (_block) {
        _block(item.tag);
    }
}
@end

