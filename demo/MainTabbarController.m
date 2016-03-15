//
//  MainTabbarController.m
//  zs
//
//  Created by administrator on 15/11/3.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import "MainTabbarController.h"
#import "KKNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"


@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViewControllers];
    [self setItems];
}

- (void)addSubViewControllers{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    KKNavigationController * firstNav = [[KKNavigationController alloc] initWithRootViewController:firstVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    KKNavigationController * secondNav = [[KKNavigationController alloc] initWithRootViewController:secondVC];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    KKNavigationController *thirdNav = [[KKNavigationController alloc] initWithRootViewController:thirdVC];
    
    FourViewController *fourVC = [[FourViewController alloc] init];
    KKNavigationController *fourNav = [[KKNavigationController alloc] initWithRootViewController:fourVC];
    
    FiveViewController * fiveVC = [[FiveViewController alloc] init];
    KKNavigationController *fiveNav = [[KKNavigationController alloc] initWithRootViewController:fiveVC];
    
   
    
    self.viewControllers = @[firstNav,secondNav,thirdNav,fourNav,fiveNav];
}

- (void)setItems{
    
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
//    self.tabBar.hidden = YES;
    
    //标题数组
    NSArray *titleArr = @[@"第一页",@"第二页",@"第三页",@"第四页",@"第五页"];
    
////    //普通状态图片数组
//    NSArray *normalImgArr = @[[UIImage imageNamed:@"项目概括"],[UIImage imageNamed:@"区位价值"],[UIImage imageNamed:@"至臻产品"],[UIImage imageNamed:@"智能物管"],[UIImage imageNamed:@"品牌团队"]];
////    选中状态图片数组
//    NSArray *selectedImgArr = @[[UIImage imageNamed:@"项目概括-选"],[UIImage imageNamed:@"区位价值-选"],[UIImage imageNamed:@"至臻产品-选"],[UIImage imageNamed:@"智能物管-选"],[UIImage imageNamed:@"品牌团队-选"]];
    
    CGRect rect = CGRectMake(0, 0, LFScreenWidth, LFTabbarHeight);
    _myTabbar = [[BXTabbar alloc] initWithFrame:rect backgroundImg:nil titleArr:titleArr normalImgArr:nil selectedImgArr:nil];
    
    __block MainTabbarController *myVC = self;
    _myTabbar.block = ^(NSInteger tag){
        if (tag==self.selectedIndex) {
            return;
        }
        
        myVC.selectedIndex = tag;
        
        /*
                if (tag !=3) {
                    self.selectedIndex = tag;
                    _tag = tag;
                }
                if (tag==3) {
                    if (![LFTool boolForKey:LF_IsLogin]) {
                        MyViewController *myVC = [[MyViewController alloc] init];
        
                        [self.navigationController pushViewController:myVC animated:YES];
        
                    }else{
                        self.selectedIndex = tag;
                    }
                }
        */
        
    };
 
    [self.tabBar addSubview:_myTabbar];
    
    // 设置导航条文字
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : LFFont(20.0f),NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
}
@end
