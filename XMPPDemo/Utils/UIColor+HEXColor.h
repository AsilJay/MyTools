//
//  UIColor+HEXColor.h
//
//
//  Created by MJD on 16/9/25.
//  Copyright (c) 2016年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEXColor)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// UIColor 转UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
