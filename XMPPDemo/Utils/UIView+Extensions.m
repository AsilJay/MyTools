//
//  UIView+Extensions.m
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

#pragma mark - 属性set方法
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (void)setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

#pragma mark - 属性get方法
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)roundedRectWith:(UIRectCorner)rectCorner
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(5.f, 5.f)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (UINavigationController *)navController
{
    // 下一个响应者
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UINavigationController class]] ) {
            return (UINavigationController *)next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}


// Move via offset
- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}

- (UIViewController *)viewController
{
    // 下一个响应者
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]] ) {
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}


- (void)removeAllSubViewsByCategory
{
    for (NSInteger i = [self.subviews count]; i>0; i--) {
        UIView *view = [self.subviews objectAtIndex:i-1];
        [view removeFromSuperview];
        view = nil;
    }
}

- (id)getSuperViewWithClass:(Class)aClass
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:aClass]) {
            return next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

- (void)shakeWithCount:(int)count interval:(NSTimeInterval)interval {
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:
                          [NSNumber numberWithDouble:interval], @"interval",
                          [NSNumber numberWithInt:count],@"count",
                          [NSValue valueWithCGPoint:self.center],@"center",
                          nil];
    [NSTimer scheduledTimerWithTimeInterval:interval target:self
                                   selector:@selector(shaking:)
                                   userInfo:info repeats:NO];
}

- (void)shaking:(NSTimer *)aTimer {
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithDictionary:[aTimer userInfo]];
    [aTimer invalidate];
    aTimer = nil;
    int shakeCnt = [[info objectForKey:@"count"] intValue];
    CGPoint orgCenter = [[info objectForKey:@"center"] CGPointValue];
    CGPoint to;
    if (shakeCnt % 2 == 0 && shakeCnt > 0) {
        to = CGPointMake(orgCenter.x + floor(random() % shakeCnt) - shakeCnt / 2,
                         orgCenter.y + floor(random() % shakeCnt) - shakeCnt / 2);
    }else {
        to = orgCenter;
    }
    
    [self setCenter:to];
    shakeCnt--;
    if (shakeCnt > 0) {
        [info setObject:[NSNumber numberWithInt:shakeCnt] forKey:@"count"];
        [NSTimer scheduledTimerWithTimeInterval:[[info objectForKey:@"interval"] doubleValue]
                                         target:self
                                       selector:@selector(shaking:)
                                       userInfo:info repeats:NO];
    }
}

- (UIImage *)re_screenshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        
        NSInvocation* invoc = [NSInvocation invocationWithMethodSignature:
                               [self methodSignatureForSelector:
                                @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invoc setTarget:self];
        [invoc setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invoc setArgument:&arg2 atIndex:2];
        [invoc setArgument:&arg3 atIndex:3];
        [invoc invoke];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end



@implementation UIView (i7Rotate360)

- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(enum i7Rotate360TimingMode)aMode {
    CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
    theAnimation.values = [NSArray arrayWithObjects:
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0,0,1)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0,0,1)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0,0,1)],
                           nil];
    theAnimation.cumulative = YES;
    theAnimation.duration = aDuration;
    theAnimation.repeatCount = aRepeatCount;
    theAnimation.removedOnCompletion = YES;
    
    if(aMode == i7Rotate360TimingModeEaseInEaseOut) {
        theAnimation.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                        nil
                                        ];
    }
    [self.layer addAnimation:theAnimation forKey:@"transform"];
}

- (void)rotate360WithDuration:(CGFloat)aDuration timingMode:(enum i7Rotate360TimingMode)aMode {
    [self rotate360WithDuration:aDuration repeatCount:1 timingMode:aMode];
}

- (void)rotate360WithDuration:(CGFloat)aDuration {
    [self rotate360WithDuration:aDuration repeatCount:4 timingMode:i7Rotate360TimingModeLinear];
}

- (void)imageWithTransformAnimation:(float)scale andRotation:(float)rotation
{
    self.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(scale, scale),M_PI*rotation);
}


@end

@implementation UIView (ShowWithAnimation)

//动画弹出来
- (void)showWithAnimation
{
    UIView *this = self;
    [UIView animateWithDuration:0.2 animations:
     ^(void){
         this.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.1f, 1.1f);
     }
                     completion:^(BOOL finished){
                         [this bounceOutAnimationStoped];
                     }];
}

- (void)bounceOutAnimationStoped
{
    UIView *this = self;
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         this.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9, 0.9);
     }
                     completion:^(BOOL finished){
                         [this bounceInAnimationStoped];
                     }];
}

- (void)bounceInAnimationStoped
{
    UIView *this = self;
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         this.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
     }
                     completion:^(BOOL finished){
                         
                     }];
}


- (void)setRoundShadowWithColor:(UIColor *)shadowColor width:(CGFloat)shadowWidth{
    self.layer.shadowColor = shadowColor.CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = self.bounds.size.width;
    float height = self.bounds.size.height;
    float x = self.bounds.origin.x;
    float y = self.bounds.origin.y;
    float addWH = shadowWidth;
    
    CGPoint topLeft      = self.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
    CGPoint topRight     = CGPointMake(x+width,y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    
    [path moveToPoint:topLeft];
    //添加四个二元曲线
    [path addQuadCurveToPoint:topRight
                 controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight
                 controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft
                 controlPoint:leftMiddle];
    //设置阴影路径
    self.layer.shadowPath = path.CGPath;
}

@end


