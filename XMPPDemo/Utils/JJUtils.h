//
//  JJUtils.h
//
//
//  Created by MJD on 16/9/25.
//  Copyright (c) 2016年 BlueMobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJUtils : NSObject

/**
 *  是否新版本
 *
 *  @return YES:表示为新版本
 */
+ (BOOL)showNewFeature;

/**
 *  更新版本信息
 */
+ (void)updateFeatureVersion;

/**把一个格式化(yyyy-MM-dd HH-mm-ss)的时间字符串转化为NSDated对象 */
+ (NSDate *)convertWithString:(NSString *)dateString;

/**拨打电话 */
+ (void)callWithPhoneNumber:(NSString *)phone;

/**屏幕上显示一个消息，需要调用hideMessage隐藏。 */
+ (void)showMessage:(NSString *)msg;

/**隐藏屏幕上的消息 */
+ (void)hideMessage;

/**显示一个信息在指定时间后删除 */
+ (void)showToast:(NSString *)msg delay:(NSUInteger)delay;

#pragma mark - 邮箱、手机等是否有效验证.
/**邮箱验证 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**昵称验证 */
+ (BOOL)isValidateNickname:(NSString *)email;

+ (BOOL)isValidatePassword:(NSString *)password;

/**手机号码验证 */
+ (BOOL)isValidateMobile:(NSString *)mobile;

/**身份证号码验证*/
+ (BOOL)isValidateIDCard:(NSString *)identityCard;

/**车牌号验证 */
+ (BOOL)isValidateCarNo:(NSString *)carNo;

+ (BOOL)isEmptyString:(NSString *)str;

+ (NSString *)dealWithTime:(NSString *)time andTimeSet:(NSString *)timeSet;
@end
