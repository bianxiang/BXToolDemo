//
//  AppDelegate.m
//  zs
//
//  Created by administrator on 11/2/15.
//  Copyright © 2015 administrator. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbarController.h"
#import "IQKeyboardManager.h"
#define kImageCount 5

@interface AppDelegate ()
{
    UIScrollView *_scrollView;
    NSTimer *_timer;
}
@end

@implementation AppDelegate
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight;//这里返回哪个值，就看你想支持那几个方向了。这里必须和后面plist文件里面的一致（我感觉是这样的）。
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootVC = [[UIViewController alloc] init];
    self.window.rootViewController = rootVC;
    [self.window addSubview:rootVC.view];
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    
    self.window.rootViewController = [[MainTabbarController alloc] init];
    
    //进入介绍界面滚动视图
//    [self gotoScrollView];
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

#pragma mark 进入介绍界面滚动视图
- (void)gotoScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, LFScreenWidth, LFScreenHeight)];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(LFScreenWidth * kImageCount, 0);
    
    for (int i = 0; i <kImageCount; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * LFScreenWidth, 0, LFScreenWidth, LFScreenHeight)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i + 1]];
        [scrollView addSubview:imageView];
        
        if (i == kImageCount -1) {
            //创建进入应用的按钮
            UIButton *intoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
            [intoBtn setTitle:@"进入应用" forState:UIControlStateNormal];
            intoBtn.backgroundColor = [UIColor orangeColor];
            intoBtn.center = CGPointMake(LFScreenWidth/2, LFScreenHeight-150);
            [intoBtn addTarget:self action:@selector(gotoMainController) forControlEvents:UIControlEventTouchUpInside];
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:intoBtn];
            
        }
    }
    
    [self.window addSubview:scrollView];
    _scrollView = scrollView;
    
    //定时器定时滚动效果
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(skip) userInfo:nil repeats:YES];
}

#pragma mark 定时器定时滚动效果
- (void)skip {
    CGFloat x = _scrollView.contentOffset.x;
    x = x + LFScreenWidth;
    if (x >= LFScreenWidth *(kImageCount)) {
        [self gotoMainController];
        [_timer setFireDate:[NSDate distantFuture]];
    }else{
        [UIView animateWithDuration:2.0f animations:^{
            _scrollView.contentOffset = CGPointMake(x, 0);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
}
#pragma mark 进入应用主界面
- (void)gotoMainController {
    [UIView animateWithDuration:1.0f animations:^{
        _scrollView.transform = CGAffineTransformMakeScale(2, 2);
        _scrollView.alpha =0.5;
    } completion:^(BOOL finished) {
        [_scrollView removeFromSuperview];
        self.window.rootViewController = [[MainTabbarController alloc] init];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
