//
//  UIBarButtonItem+Create.m
//  zs
//
//  Created by yz on 15/11/5.
//  Copyright (c) 2015年 bianxiang. All rights reserved.
//

#import "UIBarButtonItem+Create.h"

@implementation UIBarButtonItem (Create)

+ (instancetype)barButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)barButtonItemWithImage:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 65, 44);
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:kBlackColor forState:UIControlStateNormal];
    button.titleLabel.font = LFFont(13.0f);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    BXLog(@"%@",button.currentTitle);
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
