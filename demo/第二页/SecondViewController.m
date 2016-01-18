//
//  SecondViewController.m
//  zs
//
//  Created by administrator on 15/11/3.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animatedv {
//    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"第二页";
    
    [self addImgView];
}

- (void)addImgView {
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, LFScreenWidth, LFScreenHeight-LFTabbarHeight)];
    iv.image = [UIImage imageNamed:@"区位价值-界面"];
    [self.view addSubview:iv];
}

@end
