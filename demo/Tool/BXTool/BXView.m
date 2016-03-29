//
//  BXView.m
//  demo
//
//  Created by lejian on 16/2/1.
//  Copyright © 2016年 lejiantech. All rights reserved.
//

#import "BXView.h"

@implementation BXView


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
    [leftBtn setBackgroundImage:[BXView resizeImage:[UIImage imageNamed:@"buttonbar_action"]] forState:UIControlStateNormal];
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
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font {
    UIButton * btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = LFFont(13.0f);
    return btn;
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

+ (void)alertSelectedMapControllerWho:(UIViewController *)vc coordinate:(CLLocationCoordinate2D)coordinate placeName:(NSString*)placeName {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //这个判断其实是不需要的
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
            MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil]];
            toLocation.name = placeName;;
            
            [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                           launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
        }];
        
        [alert addAction:action];
    }
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",coordinate.latitude, coordinate.longitude]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",urlString);
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }];
        
        [alert addAction:action];
    }
    
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&lat=%f&lon=%f&dev=0&style=2",[self getApplicationName],[self getApplicationScheme],coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",urlString);
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }];
        
        [alert addAction:action];
    }
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"谷歌地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",[self getApplicationName],[self getApplicationScheme],coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",urlString);
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }];
        
        [alert addAction:action];
    }
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    
    [vc presentViewController:alert animated:YES completion:^{
        
    }];
}


+ (NSString *)getApplicationName
{
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    return [bundleInfo valueForKey:@"CFBundleDisplayName"] ?: [bundleInfo valueForKey:@"CFBundleName"];
}

+ (NSString *)getApplicationScheme
{
    NSDictionary *bundleInfo    = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleIdentifier  = [[NSBundle mainBundle] bundleIdentifier];
    NSArray *URLTypes           = [bundleInfo valueForKey:@"CFBundleURLTypes"];
    
    NSString *scheme;
    for (NSDictionary *dic in URLTypes)
    {
        NSString *URLName = [dic valueForKey:@"CFBundleURLName"];
        if ([URLName isEqualToString:bundleIdentifier])
        {
            scheme = [[dic valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
            break;
        }
    }
    
    return scheme;
}


+ (void)countDownWithBtn:(UIButton *)btn {
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置 特别注明：UI的改变一定要在主线程中进行
                [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
                btn.backgroundColor = kThemeColor;
                btn.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [btn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor colorWithWhite:0.804 alpha:1.000];
                btn.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}
@end
