//
//  JJUtils.m
//
//
//  Created by MJD on 16/9/25.
//  Copyright (c) 2016年 BlueMobi. All rights reserved.
//

#import "JJUtils.h"

#import "JJTools.h"
//#import "BMGlobalMacro.h"

@implementation JJUtils

+ (BOOL)showNewFeature
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *previewFeatureVersion = [userDefaults stringForKey:@"previewFeatureVersion"];
    
    if (![previewFeatureVersion isExist]) return YES;
    
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    if ([previewFeatureVersion isEqualToString:version]) {
        return NO;
    }
    return YES;
}

+ (void)updateFeatureVersion
{
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:version forKey:@"previewFeatureVersion"];
    [userDefaults synchronize];
}

+ (void)showMessage:(NSString *)msg
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.label.text = [NSString stringWithFormat:@"\r\n%@", msg];
    });
}

+ (void)hideMessage
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:kWindow animated:NO];
    });
}

+ (void)showToast:(NSString *)msg delay:(NSUInteger)delay
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.labelText = msg;
        hud.mode = MBProgressHUDModeText;
        [hud hide:YES afterDelay:delay];
    });
}

+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18, 17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
    
}

+ (BOOL)isValidatePassword:(NSString *)password{
    NSString *passRegex = @"^[a-zA-Z0-9_]\\w{5,17}$";
    NSPredicate *passTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passRegex];
    return [passTest evaluateWithObject:password];
}

+ (BOOL)isValidateIDCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)isValidateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carNo];
}

+ (NSDate *)convertWithString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale currentLocale];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter dateFromString:dateString];
}

+ (BOOL)isEmptyString:(NSString *)str
{
    if (str == nil) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+ (NSString *)dealWithTime:(NSString *)time andTimeSet:(NSString *)timeSet
{
    
    //2015-11-4 14:25
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:timeSet];
    NSDate *date=[formatter dateFromString:time];
    
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
    
    timeInterval = -timeInterval;
    
    long temp = 0;
    
    NSString *result;
    temp = timeInterval/(24*3600);
    switch (temp) {
        case 1:
        case 2:
        {
            NSString *yesterDayOrTheDayBeforeYes;
            if (temp == 1) {
                yesterDayOrTheDayBeforeYes = @"昨天";
            }else{
                yesterDayOrTheDayBeforeYes = @"前天";
            }
            result = [NSString stringWithFormat:@"%@", yesterDayOrTheDayBeforeYes];
        }
            break;
        default:
            result = time;
            break;
    }
    return  result;
}

+ (BOOL)isValidateNickname:(NSString *)name{
    
    NSString *regex = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *nickNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [nickNamePredicate evaluateWithObject:name];
    
}

@end
