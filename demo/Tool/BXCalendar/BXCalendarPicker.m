//
//  BXCalendarPicker.m
//  BXCalendar
//
//  Created by bianxiang on 16/3/23.
//  Copyright © 2016年 bianxiang. All rights reserved.
//

#import "BXCalendarPicker.h"
#import "BXCalendar.h"
#define ScreenFrame [[UIScreen mainScreen] bounds]

#define kContentViewHeight 315
@interface BXCalendarPicker ()

@property (nonatomic,strong) UIButton *cover;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIButton *previousBtn;

@end

@implementation BXCalendarPicker

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = ScreenFrame;
        
        
        [self setupCover];
        [self setupContentView];
        
        [self addSubviewsWithFrame:ScreenFrame];
    }
    return self;
}

//设置遮罩
- (void)setupCover {
    self.cover = [[UIButton alloc] initWithFrame:ScreenFrame];
    self.cover.backgroundColor = [UIColor clearColor];
    [self.cover addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cover];
}

- (void)setupContentView {
    self.contentView = [[UIView alloc] init];
    self.contentView.frame = CGRectMake(0, ScreenFrame.size.height, ScreenFrame.size.width, 315);
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
}

- (void)addSubviewsWithFrame:(CGRect)frame {
    
    BXCalendar *calendar = [[BXCalendar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 260) Cancel:^(NSString *dateStr) {
        
        [self hide];
    } Sure:^(NSString *dateStr) {
        BXLog(@"%@", dateStr);
        [self hide];
    }];
    [self.contentView addSubview:calendar];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kContentViewHeight-55, frame.size.width, kContentViewHeight-260)];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.scrollView];
    
    
    NSArray *timeBucketArr = @[@"00:00-03:00",@"06:00-09:00",@"12:00:15:00"];
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10 +(10+130)*i, 5, 130, 45)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:kThemeColor forState:UIControlStateNormal];
        [btn setTitle:timeBucketArr[i] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
        if (i == 2) {
            self.scrollView.contentSize = CGSizeMake(130*3+10*4, 0);
        }
        
        if (i == 0) {
            [self btn:btn];
        }
    }
}

- (void)btn:(UIButton*)btn {
    NSLog(@"%@",btn.currentTitle);
    _previousBtn.backgroundColor = [UIColor whiteColor];
    [_previousBtn setTitleColor:kThemeColor forState:UIControlStateNormal];
    
    btn.backgroundColor = kThemeColor;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    _previousBtn = btn;
}
- (void)showAnimation {
    [UIView animateWithDuration:0.5f animations:^{
        self.cover.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, - kContentViewHeight);
    }];
    
}

- (void)hide {
    [UIView animateWithDuration:0.5f animations:^{
        self.cover.backgroundColor = [UIColor clearColor];
        self.contentView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
