//
//  BMSplashController.h
//  ZPM
//
//  Created by 陈宇 on 15/3/24.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>


@interface BMSplashController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) CLLocationManager * locationManager;
@property (nonatomic, retain) NSString * cityName;

@end
