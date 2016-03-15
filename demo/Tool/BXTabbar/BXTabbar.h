//
//  BXTabbar.h
//  DaiTou
//
//  Created by bianxiang on 16/3/15.
//  Copyright © 2016年 bianxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

// 创建图片宏
#define BXImage(imgName) [UIImage imageNamed:imgName]

typedef void(^ItemClickedBlock)(NSInteger tag);

@interface BXTabbar : UIView

/** Tabbar init method
 frame                   : frame
 backgroundImg           : 背景图片
 titleArr                : tabbar上所有元素项文字数组
 normalImgArr            : tabbar上所有元素项普通状态图片数组
 selectedImgArr          : tabbar上所有元素项选中状态图片数组
 */
- (instancetype)initWithFrame:(CGRect)frame backgroundImg:(UIImage *)img titleArr:(NSArray *)titleArr normalImgArr:(NSArray *)normalImgArr selectedImgArr:(NSArray *)selectedImgArr;

// 传出tag值的block
@property (nonatomic, strong) ItemClickedBlock block;

@end
