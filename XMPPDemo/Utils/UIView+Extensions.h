//
//  UIView+Extensions.h
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extensions)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

/**
 *  改变UIView制定几个角圆角
 */
- (void)roundedRectWith:(UIRectCorner)rectCorner;

//事件响应链
- (UINavigationController *)navController;

- (UIViewController *)viewController;


-(void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

- (void)removeAllSubViewsByCategory;
- (id)getSuperViewWithClass:(Class)aClass;

//shake动画
- (void)shakeWithCount:(int)count interval:(NSTimeInterval)interval;

//截图
- (UIImage *)re_screenshot;

@end

enum i7Rotate360TimingMode {
    i7Rotate360TimingModeEaseInEaseOut,
    i7Rotate360TimingModeLinear
};

@interface UIView (i7Rotate360)
- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(enum i7Rotate360TimingMode)aMode;
- (void)rotate360WithDuration:(CGFloat)aDuration timingMode:(enum i7Rotate360TimingMode)aMode;
- (void)rotate360WithDuration:(CGFloat)aDuration;
- (void)imageWithTransformAnimation:(float)scale andRotation:(float)rotation;
@end

//弹出框动画
@interface UIView (ShowWithAnimation)
- (void)showWithAnimation;

- (void)setRoundShadowWithColor:(UIColor *)shadowColor width:(CGFloat)shadowWidth;
@end


