//
//  CALayer+Xib.m
//  DaiTou
//
//  Created by bianxiang on 16/3/31.
//  Copyright © 2016年 bianxiang. All rights reserved.
//

#import "CALayer+Xib.h"

@implementation CALayer (Xib)

- (void)setBorderUIColor:(UIColor *)borderUIColor {
    self.borderColor = borderUIColor.CGColor;
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}
@end
