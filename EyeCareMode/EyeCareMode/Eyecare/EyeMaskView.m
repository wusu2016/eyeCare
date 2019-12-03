//
//  EyeMaskView.m
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "EyeMaskView.h"
/* 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/* 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation EyeMaskView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.5;
}

@end
