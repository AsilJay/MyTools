//
//  LoginRegisterController.m
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/6.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import "LoginRegisterController.h"
#import "XMPPManager.h"


@interface LoginRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *logoButton;


@property (nonatomic,strong) XMPPManager *manager;


@end

@implementation LoginRegisterController

//- (instancetype)init {
//
//    if (self = [super init]) {
//
//    }
//    return self;
//}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialSubViews];
        self.manager = [XMPPManager defaultManager];
        self.manager.loginDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performAnimation];
    
}

- (void)initialSubViews{
    
    UIColor *placeholderColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.usernameTextField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordTextField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.passwordTextField.secureTextEntry = YES;
}

- (void)performAnimation{
    self.loginButton.transform = CGAffineTransformTranslate(self.loginButton.transform, 0, 400);
    self.registerButton.transform = CGAffineTransformTranslate(self.registerButton.transform, 0, 100);
    
    self.logoButton.transform = CGAffineTransformScale(self.logoButton.transform, 1.2, 1.2);
    self.logoButton.transform = CGAffineTransformTranslate(self.logoButton.transform, 300, 0);
    
    [UIView animateWithDuration:0.8 delay:0.5 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        self.loginButton.transform = CGAffineTransformIdentity;
        self.logoButton.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    [UIView animateWithDuration:0.8 delay:0.8 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.registerButton.transform = CGAffineTransformIdentity;
    } completion:nil];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (IBAction)loginAction:(UIButton *)sender {
    
    [self.manager loginwithName:self.usernameTextField.text andPassword:self.passwordTextField.text];
    
}

- (IBAction)registerAction:(UIButton *)sender {
    [self.manager registerWithName:self.usernameTextField.text andPassword:self.passwordTextField.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) XMPPManager:(id)manager didResponse:(XMPPManagerResponseType)responseType {
    switch (responseType) {
        case XMPPManagerResponseTypeConnectFail:
            {
                NSLog(@"===%zd",responseType);
            }
            break;
        case XMPPManagerResponseTypeAuthenRegisterFail:
        {
            NSLog(@"===%zd",responseType);

        }
            break;
        case XMPPManagerResponseTypeAuthenSuccess:
        {
            NSLog(@"===%zd",responseType);

        }
            break;
        case XMPPManagerResponseTypeRegisterSuccess:
        {
            NSLog(@"===%zd",responseType);

        }
            break;
            
        default:
            break;
    }
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
