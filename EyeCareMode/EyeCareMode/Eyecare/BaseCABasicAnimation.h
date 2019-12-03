//
//  BaseCABasicAnimation.h
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^BaseCABasicAnimationDidblock)(CAAnimation * anim, BOOL flag);
@interface BaseCABasicAnimation : CABasicAnimation <CAAnimationDelegate>
/** block */
@property (nonatomic, copy) BaseCABasicAnimationDidblock baseCABasicAnimationDidblock;


@end

NS_ASSUME_NONNULL_END
