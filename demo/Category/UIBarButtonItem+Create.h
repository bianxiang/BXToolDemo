//
//  UIBarButtonItem+Create.h
//  zs
//
//  Created by yz on 15/11/5.
//  Copyright (c) 2015年 bianxiang. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Create)

+ (instancetype)barButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

+ (instancetype)barButtonItemWithImage:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action;
@end
