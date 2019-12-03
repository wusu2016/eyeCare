//
//  EyeCareManage.m
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "EyeCareManage.h"

#import "SkinCoverWindow.h"
#import "BaseCABasicAnimation.h"
#import "EyeMaskView.h"

#define kAnimationDuration 0.25
/* 获取KEYWINDOW对象 */
#define kKeyWindow  [[UIApplication sharedApplication] keyWindow]
/* 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/* 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface EyeCareManage()
/**  */
@property (nonatomic, strong) SkinCoverWindow *skinCoverWindow;
// 之前的一个window
@property(nonatomic, weak) UIWindow *previousKeyWindow;

/** view */
@property (nonatomic, strong) EyeMaskView *eyeMaskView;
@end

@implementation EyeCareManage

- (EyeMaskView *)eyeMaskView
{
    if (!_eyeMaskView) {
        _eyeMaskView = [[EyeMaskView alloc]init];
    }
    return _eyeMaskView;
}
/// NSUserDefaults存的key
static NSString * const kEyeCareModeStatus = @"kEyeCareModeStatus";
- (BOOL)queryEyeCareModeStatus
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kEyeCareModeStatus];
}

//直接使用keyWindow
- (void)switchEyeCareMode:(BOOL)on
{
    // 切换的具体实现
    
    // 将状态写入设置
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:kEyeCareModeStatus];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    if (on) {
        
        
        // 记录上一个keywindow
       
        // 显示出来
        kKeyWindow.maskView = self.eyeMaskView;
        
        // 出现动画
        BaseCABasicAnimation *opacityAnimation = [BaseCABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(0);
        opacityAnimation.toValue = @(1);
        opacityAnimation.duration = kAnimationDuration;
        opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.removedOnCompletion = NO;
        
        opacityAnimation.baseCABasicAnimationDidblock = ^(CAAnimation * _Nonnull anim, BOOL flag) {
            // 把key还给之前的window
            //[self.previousKeyWindow makeKeyWindow];
        };
        
       // [self.skinCoverWindow.layer addAnimation:opacityAnimation forKey:@"showAnimation"];
    }else{
        // 隐藏skinCoverWindow
        // 消失动画
        kKeyWindow.maskView = nil;
        BaseCABasicAnimation *opacityAnimation = [BaseCABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(1);
        opacityAnimation.toValue = @(0);
        opacityAnimation.duration = kAnimationDuration;
        opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.removedOnCompletion = NO;
        opacityAnimation.baseCABasicAnimationDidblock = ^(CAAnimation * _Nonnull anim, BOOL flag) {
//            self.skinCoverWindow.hidden = YES;
//            self.previousKeyWindow = nil;
        };
        
        //[self.skinCoverWindow.layer addAnimation:opacityAnimation forKey:@"hideAnimation"];
    }
}

- (void)switchEyeCareMode2:(BOOL)on
{
    // 切换的具体实现
    
    // 将状态写入设置
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:kEyeCareModeStatus];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    if (on) {
        // 记录上一个keywindow
        self.previousKeyWindow = [UIApplication sharedApplication].keyWindow;
        // 显示出来
        self.skinCoverWindow.hidden = NO;
        // 出现动画
        BaseCABasicAnimation *opacityAnimation = [BaseCABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(0);
        opacityAnimation.toValue = @(1);
        opacityAnimation.duration = kAnimationDuration;
        opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.removedOnCompletion = NO;
        
        opacityAnimation.baseCABasicAnimationDidblock = ^(CAAnimation * _Nonnull anim, BOOL flag) {
            // 把key还给之前的window
            [self.previousKeyWindow makeKeyWindow];
        };
        
        [self.skinCoverWindow.layer addAnimation:opacityAnimation forKey:@"showAnimation"];
    }else{
        [self.previousKeyWindow makeKeyWindow];
        if ([[UIApplication sharedApplication].windows containsObject:self.skinCoverWindow]) {
            // 隐藏skinCoverWindow
            // 消失动画
            BaseCABasicAnimation *opacityAnimation = [BaseCABasicAnimation animationWithKeyPath:@"opacity"];
            opacityAnimation.fromValue = @(1);
            opacityAnimation.toValue = @(0);
            opacityAnimation.duration = kAnimationDuration;
            opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            opacityAnimation.fillMode = kCAFillModeForwards;
            opacityAnimation.removedOnCompletion = NO;
            opacityAnimation.baseCABasicAnimationDidblock = ^(CAAnimation * _Nonnull anim, BOOL flag) {
                self.skinCoverWindow.hidden = YES;
                self.previousKeyWindow = nil;
            };
            
            [self.skinCoverWindow.layer addAnimation:opacityAnimation forKey:@"hideAnimation"];
        } else {
            NSAssert(NO, @"Error:关闭护眼模式的时windows没有找到WESkinCoverWindow！！");
        }
    }
}


static NSInteger const kWeSkinCoverWindowLevel = 2099;
#pragma mark - setter & getter
- (SkinCoverWindow *)skinCoverWindow
{
    if (!_skinCoverWindow) {
        // 给window赋值上初始的frame，在ios9之前如果不赋值系统默认认为是CGRectZero
        _skinCoverWindow = [[SkinCoverWindow alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _skinCoverWindow.windowLevel = kWeSkinCoverWindowLevel;
        _skinCoverWindow.userInteractionEnabled = NO;
        // 添加到UIScreen
        [_skinCoverWindow makeKeyWindow];
    }
    return _skinCoverWindow;
}
static EyeCareManage *_sharedSingleton = nil;
+ (instancetype)sharedUtil {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //不能再使用alloc方法
        //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

@end
