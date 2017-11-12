//
//  XDTabBar.m
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/9.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import "XDTabBar.h"
#import "JJTools.h"

@implementation XDTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tintColor = [UIColor colorWithHexString:@"22ff33" alpha:1.0];
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

@end
