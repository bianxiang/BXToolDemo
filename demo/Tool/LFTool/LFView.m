//
//  LFView.m
//  zs
//
//  Created by administrator on 11/2/15.
//  Copyright © 2015 administrator. All rights reserved.
//

#import "LFView.h"

@implementation LFView

+ (UIImage *)resizeImage:(UIImage *)oldImg
{
    CGFloat w = oldImg.size.width;
    CGFloat h = oldImg.size.height;
    
    UIImage *newImg = [oldImg stretchableImageWithLeftCapWidth:w / 2 topCapHeight:h / 2];
    return newImg;
}

+ (UIButton *)createNavigationBtnWithTitle:(NSString *)title
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[LFView resizeImage:[UIImage imageNamed:@"buttonbar_action"]] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 60, 30);
    return leftBtn;
}

+ (UIImageView *)createIconWithFrame:(CGRect)frame
{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
    iv.layer.cornerRadius = 10.0f;
    iv.layer.masksToBounds = YES;
    
    return iv;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    return label;
}

+ (void)alertWithMessage:(NSString *)message who:(UIViewController *)vc
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction *action) {
        
    }]];
    
    [vc presentViewController:alertC animated:YES completion:nil];
}

+ (void)alertHudWithText:(NSString *)text who:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
}

+ (void)hideHudWithView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (UIView *)clearWithImgName:(NSString *)imgName text:(NSString *)text vc:(UIViewController *)vc{
    UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake1(0, 0, LFScreenWidth, LFScreenHeight)];
  
    clearView.backgroundColor = [UIColor whiteColor];
    [vc.view addSubview:clearView];
    UIImageView *noDeviceIV = [[UIImageView alloc] initWithFrame:CGRectMake1(137, 243, 150, 96)];
    noDeviceIV.image = LFImage(imgName);
    [clearView addSubview:noDeviceIV];
        
    CGFloat noDeviceIVHeight = CGRectGetMaxY(noDeviceIV.frame);
    UILabel *noDeviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(W((LFScreenWidth-133)/2), noDeviceIVHeight, W(133), H(16))];
    noDeviceLabel.font = LFFont(12.0f);
    noDeviceLabel.text = text;
    noDeviceLabel.textAlignment = NSTextAlignmentCenter;
    noDeviceLabel.textColor = [UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1];
    [clearView addSubview:noDeviceLabel];
    
    return clearView;
}


@end
