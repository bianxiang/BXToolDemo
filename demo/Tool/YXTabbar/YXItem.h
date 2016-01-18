//
//  YXItem.h
//  zs
//
//  Created by administrator on 15/11/3.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXItem : UIButton

/** 类方法创建
 frame           : frame
 tag             : 标识
 normalImg       : 普通状态图片
 selectedImg     : 被选中状态图片
 title           : 文字
 titleColor      : 文字颜色
 */
+ (instancetype)itemWithFrame:(CGRect)frame tag:(NSInteger)tag normalImg:(UIImage *)normalImg selectedImg:(UIImage *)selectedImg title:(NSString *)title titleColor:(UIColor *)titleColor;

@end
