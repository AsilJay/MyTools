//
//  XDTabBarController.m
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/9.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import "XDTabBarController.h"
#import "XDTabBar.h"
#import "XDFriendsViewController.h"
#import "XDMessageViewController.h"
#import "XDCircleViewController.h"

#import "LoginRegisterController.h"

@interface XDTabBarController ()

@end

@implementation XDTabBarController

- (instancetype)init {
    if (self = [super init]) {
        XDMessageViewController *messageVC = [[XDMessageViewController alloc] init];
        [self addChildViewController:messageVC withTitle:@"消息" withImage:nil selectedImage:nil isEmbeddedInNavigationController:YES];
        
        XDFriendsViewController *friendsVC = [[XDFriendsViewController alloc] init];
        [self addChildViewController:friendsVC withTitle:@"联系人" withImage:nil selectedImage:nil isEmbeddedInNavigationController:YES];
        
        XDCircleViewController *circleVC = [[XDCircleViewController alloc] init];
        [self addChildViewController:circleVC withTitle:@"动态" withImage:nil selectedImage:nil isEmbeddedInNavigationController:YES];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginRegisterController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"Login"];
        

        UINavigationController *navi = (UINavigationController *)self.viewControllers[0];
        [navi.visibleViewController presentViewController:loginVC animated:YES completion:nil];
//            [self presentViewController:loginVC animated:YES completion:nil];
    }
    return self;
}



- (void)addChildViewController:(UIViewController *)viewController withTitle:(NSString *)title withImage:(UIImage *)image selectedImage:(UIImage *)selectedImage isEmbeddedInNavigationController:(BOOL)isEmbedded {
    viewController.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    
    if (isEmbedded) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self addChildViewController:navi];
    }else {
        [self addChildViewController:viewController];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    XDTabBar *tabBar = [[XDTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
