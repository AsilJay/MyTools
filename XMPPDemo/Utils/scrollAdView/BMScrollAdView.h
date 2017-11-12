//
//  BMScrollAdView.h
//  zebraLife
//
//  Created by TengfeiMa on 15/12/17.
//  Copyright © 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JScrollView+PageControl+AutoScroll.h"

@interface BMScrollAdView : UIView

- (instancetype)initAdViewWithFrame:(CGRect)frame delayTime:(float)time target:(id)target imageUrlArray:(NSArray *)urlArray pageIndicatorTintColor:(UIColor *)color;
@end
