//
//  BXItem.m
//  DaiTou
//
//  Created by bianxiang on 16/3/15.
//  Copyright © 2016年 bianxiang. All rights reserved.
//

#import "BXItem.h"

@implementation BXItem

+ (instancetype)itemWithFrame:(CGRect)frame tag:(NSInteger)tag normalImg:(UIImage *)normalImg selectedImg:(UIImage *)selectedImg title:(NSString *)title titleColor:(UIColor *)titleColor
{
    // 可变值通过参数传入
    BXItem *item = [[BXItem alloc] initWithFrame:frame];
    item.tag = tag;
    
    [item setBackgroundImage:normalImg forState:UIControlStateNormal];
    [item setBackgroundImage:selectedImg forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    
    // 这些值是固定不变的.
    item.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    item.imageView.contentMode = UIViewContentModeCenter;
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return item;
}

// 覆盖高亮状态
- (void)setHighlighted:(BOOL)highlighted { }

// 设置图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * (2.0 / 3));
}

// 设置文字frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height * (2.0 / 3), contentRect.size.width, contentRect.size.height * (1.0 / 3));
}

// 设置图片frame
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height );
//}

// 设置文字frame
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    return CGRectMake(0, contentRect.size.height * (2.0 / 3), contentRect.size.width, contentRect.size.height * (1.0 / 3));
//}


@end

