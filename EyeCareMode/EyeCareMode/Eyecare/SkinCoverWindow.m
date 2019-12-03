//
//  SkinCoverWindow.m
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "SkinCoverWindow.h"
#import "SkinCoverLayer.h"

@implementation SkinCoverWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 移除所有的子layer
        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
        // 添加layer
        SkinCoverLayer *skinCoverLayer = [SkinCoverLayer layer];
        skinCoverLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        skinCoverLayer.backgroundColor = [UIColor blackColor].CGColor;
        skinCoverLayer.opacity = 0.5;
        [self.layer addSublayer:skinCoverLayer];
        
       
    }
    return self;
}

@end
