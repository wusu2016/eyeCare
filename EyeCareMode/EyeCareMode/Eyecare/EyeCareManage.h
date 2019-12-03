//
//  EyeCareManage.h
//  LightofParents_iOS_Guest
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EyeCareManage : NSObject
/**
 * 单例创建方法
 * @return 单例对象
 */
+ (instancetype)sharedUtil;

/**
 * 护眼模式是否已经打开
 * @return 是否已经打开
 */
- (BOOL)queryEyeCareModeStatus;



#warning mark 以下两种任选一种
/**
 * 切换护眼模式
 * @param on 是否打开 //直接使用keyWindow (正在使用的)

 */
- (void)switchEyeCareMode:(BOOL)on;

/**
 * 切换护眼模式
 * @param on 是否打开 //参照简书 新浪微博 的做法 有点一闪一闪的问题 有多余代码，自行删减
        https://www.jianshu.com/p/188b64828ddb
 */
- (void)switchEyeCareMode2:(BOOL)on;

@end



NS_ASSUME_NONNULL_END
