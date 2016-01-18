//
//  LFView.h
//  zs
//
//  Created by administrator on 11/2/15.
//  Copyright © 2015 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFView : UIView

// 设置图片的拉伸点
+ (UIImage *)resizeImage:(UIImage *)oldImg;

// 创建导航条按钮
+ (UIButton *)createNavigationBtnWithTitle:(NSString *)title;

// 创建图标图片视图
+ (UIImageView *)createIconWithFrame:(CGRect)frame;

// 创建标签视图
+ (UILabel *)createLabelWithFrame:(CGRect)frame font:(UIFont *)font;

// 弹出提示控制器
+ (void)alertWithMessage:(NSString *)message who:(UIViewController *)vc;

// 弹出缓冲视图
+ (void)alertHudWithText:(NSString *)text who:(UIView *)view;
// 隐藏缓冲视图
+ (void)hideHudWithView:(UIView *)view;

+ (UIView *)clearWithImgName:(NSString *)imgName text:(NSString *)text vc:(UIViewController *)vc;

@end
