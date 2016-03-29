//
//  BXView.h
//  demo
//
//  Created by lejian on 16/2/1.
//  Copyright © 2016年 lejiantech. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import MapKit;
@interface BXView : UIView


// 设置图片的拉伸点
+ (UIImage *)resizeImage:(UIImage *)oldImg;

// 创建导航条按钮
+ (UIButton *)createNavigationBtnWithTitle:(NSString *)title;

// 创建图标图片视图
+ (UIImageView *)createIconWithFrame:(CGRect)frame;

// 创建标签视图
+ (UILabel *)createLabelWithFrame:(CGRect)frame font:(UIFont *)font;
/**
 *  创建按钮
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font;
// 弹出提示控制器
+ (void)alertWithMessage:(NSString *)message who:(UIViewController *)vc;

// 弹出缓冲视图
+ (void)alertHudWithText:(NSString *)text who:(UIView *)view;
// 隐藏缓冲视图
+ (void)hideHudWithView:(UIView *)view;

+ (UIView *)clearWithImgName:(NSString *)imgName text:(NSString *)text vc:(UIViewController *)vc;

/**
 *  地图选择器
 */
+ (void)alertSelectedMapControllerWho:(UIViewController *)vc coordinate:(CLLocationCoordinate2D)coordinate placeName:(NSString*)placeName ;



+ (NSString *)getApplicationName;
+ (NSString *)getApplicationScheme;

/**
 *  按钮获取验证码的倒计时
 */
+ (void)countDownWithBtn:(UIButton *)btn;
@end
