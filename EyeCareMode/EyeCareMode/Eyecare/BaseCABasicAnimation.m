//
//  BaseCABasicAnimation.m
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "BaseCABasicAnimation.h"

@implementation BaseCABasicAnimation

- (void)setBaseCABasicAnimationDidblock:(BaseCABasicAnimationDidblock)baseCABasicAnimationDidblock

{
    self.delegate = self;
    _baseCABasicAnimationDidblock = baseCABasicAnimationDidblock;
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.baseCABasicAnimationDidblock) {
        self.baseCABasicAnimationDidblock(anim, flag);
    }
}
@end
