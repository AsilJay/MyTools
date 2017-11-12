//
//  BMSplashController.m
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "BMSplashController.h"
#import "BMMainTool.h"
#import "JJTools.h"



@interface BMSplashController ()<UIAlertViewDelegate,CLLocationManagerDelegate>
{
    NSString * city;// 临时寄存获取城市信息
}

@end

@implementation BMSplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIStoryboard *st = [UIStoryboard storyboardWithName:@"BMLaunchScreen" bundle:nil];
//    
//    kWindow.rootViewController = [st instantiateViewControllerWithIdentifier:@"LaunchScreenViewController"];
    
//    [self performSelector:@selector(autoJump) withObject:self afterDelay:2.0f];
    [self autoJump];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self autoJump];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark 自动跳转到其余页面
- (void)autoJump
{
    kWindow.rootViewController = [BMMainTool chooseRootViewController];
}
@end
