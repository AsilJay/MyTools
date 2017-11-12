//
//  BMScrollAdView.m
//  zebraLife
//
//  Created by TengfeiMa on 15/12/17.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import "BMScrollAdView.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface BMScrollAdView ()<JScrollViewViewDelegate>

@property(nonatomic,strong) JScrollView_PageControl_AutoScroll *scrollView;
@end

@implementation BMScrollAdView

- (instancetype)initAdViewWithFrame:(CGRect)frame delayTime:(float)time target:(id)target imageUrlArray:(NSArray *)urlArray pageIndicatorTintColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createAdViewWithFrame:frame delayTime:time target:target imageUrlArray:urlArray pageIndicatorTintColor:color];
    }
    return self;
}

-(void)createAdViewWithFrame:(CGRect)frame delayTime:(float)time target:(id)target imageUrlArray:(NSArray *)urlArray pageIndicatorTintColor:(UIColor *)color
{
    _scrollView = [[JScrollView_PageControl_AutoScroll alloc]initWithFrame:frame];
    _scrollView.isShowTimerDelay = YES;
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < urlArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
//        [imageView setImageWithUrl:urlArray[i]];
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlArray[i]]];
        [tempArray addObject:imageView];
    }
    
    _scrollView.autoScrollDelayTime = time;
    _scrollView.delegate = target;
    [_scrollView setViewsArray:tempArray];
    [_scrollView shouldAutoShow:YES];
    [_scrollView.pageControl setCurrentPageIndicatorTintColor:color];
    [self addSubview:_scrollView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
