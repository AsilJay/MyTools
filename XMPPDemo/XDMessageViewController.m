//
//  XDMessageViewController.m
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/9.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import "XDMessageViewController.h"

@interface XDMessageViewController ()

@end

@implementation XDMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [[BMHttpTool sharedInstance] uploadWithPath:<#(NSString *)#> params:<#(NSDictionary *)#> files:<#(NSDictionary *)#> success:<#^(id response)success#> failure:<#^(NSError *error)failure#>]
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
