//
//  BMNewFeatureController.m
//  ZPM
//
//  Created by 陈宇 on 15/3/20.
//  Copyright (c) 2015年 陈宇. All rights reserved.
//

#import "BMNewFeatureController.h"
#import "BMMainTool.h"


const CGFloat kMaxFeatureCount = 4;

@interface BMNewFeatureController () <UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}
@end

@implementation BMNewFeatureController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    //添加scrollview
    [self setupScrollView];
    
    //添加pageControl
    [self setupPageControl];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)enterApplication
{
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:version forKey:@"previewFeatureVersion"];
    [userDefaults synchronize];
    
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UITabBarController *tabVC   = [storyBoard instantiateViewControllerWithIdentifier:@"RootTabBarViewController"];
    
    kWindow.rootViewController = tabVC;
}

#pragma mark - 私有方法
- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    // 添加新特性图片
    for (int i = 0; i < kMaxFeatureCount; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
        imageView.origin = CGPointMake(kScreenWidth * i, 0);
        imageView.size = CGSizeMake(kScreenWidth, kScreenHeight);
        imageView.backgroundColor = BMRandomColor;
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(kScreenWidth * kMaxFeatureCount, 0);
    [self.view addSubview:scrollView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(kScreenWidth*(kMaxFeatureCount-1)+self.view.centerX-85, kScreenHeight*0.93-30-30-20, 170, 70);
    [scrollView addSubview:button];
    button.backgroundColor = [UIColor clearColor];
    button.layer.cornerRadius = 10.0f;
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [UIColor clearColor].CGColor;
//    [button setTitle:@"进入应用" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterApplication) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupPageControl
{
    UIPageControl *control = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30.f)];
    control.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.9);
    control.numberOfPages = kMaxFeatureCount;
    control.pageIndicatorTintColor = [UIColor clearColor];
    control.currentPageIndicatorTintColor = [UIColor clearColor];
    
    [self.view addSubview:control];
    _pageControl = control;
    _pageControl.hidden = YES;
}

#pragma mark - scrollview代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger page = (scrollView.contentOffset.x / kScreenWidth) + 0.5;
    _pageControl.currentPage = page;
}

@end
