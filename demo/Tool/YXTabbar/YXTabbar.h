//
//  YXTabbar.h
//  zs
//
//  Created by administrator on 15/11/3.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

// 创建图片宏
#define YXImage(imgName) [UIImage imageNamed:imgName]

typedef void(^ItemClickedBlock)(NSInteger tag);

@interface YXTabbar : UIView

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
