//
//  XMPPManager.m
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/6.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import "XMPPManager.h"

static XMPPManager *manager = nil;

@implementation XMPPManager

+ (XMPPManager *)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XMPPManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        self.xmppStream = [[XMPPStream alloc] init];
        self.xmppStream.hostName = @"192.168.0.104";
        self.xmppStream.hostPort = 5222;
        [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}


// 登录
- (void)loginwithName:(NSString *)userName andPassword:(NSString *)password {
    
    self.connectType = ConnectTypeLogin;
    //这里记录用户输入的密码，在登录（注册）的方法里面使用
    self.username = userName;
    self.password = password;
    //  创建xmppjid（用户0,  @param NSString 用户名，域名，登录服务器的方式（苹果，安卓等）
    
    XMPPJID *jid = [XMPPJID jidWithUser:userName domain:@"chenyuan" resource:@"iPhone8"];
    self.xmppStream.myJID = jid;
    //连接到服务器
    [self connectToServer];
    
}

// 注册
- (void)registerWithName:(NSString *)userName andPassword:(NSString *)password {
    self.connectType = ConnectTypeRegister;
    //这里记录用户输入的密码，在登录（注册）的方法里面使用
    self.username = userName;
    self.password = password;
    //  创建xmppjid（用户0,  @param NSString 用户名，域名，登录服务器的方式（苹果，安卓等）
    
    XMPPJID *jid = [XMPPJID jidWithUser:userName domain:@"chenyuan" resource:@"iPhone8"];
    self.xmppStream.myJID = jid;
    //连接到服务器
    [self connectToServer];
}


// 登出
- (void)logout {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [self.xmppStream sendElement:presence];
    [self.xmppStream disconnect];
}

///////////////////////////////连接服务器/////////////////////////

// 连接服务器
-(void)connectToServer{
    //如果已经存在一个连接，需要将当前的连接断开，然后再开始新的连接
    if ([self.xmppStream isConnected]) {
        [self logout];
    }       
    NSError *error = nil;
    [self.xmppStream connectWithTimeout:10.0f error:&error];
    if (error) {
        NSLog(@"error = %@",error);
    }
}

//连接服务器失败的方法
-(void)xmppStreamConnectDidTimeout:(XMPPStream *)sender{
    if ([self.loginDelegate respondsToSelector:@selector(XMPPManager:didResponse:)]) {
        [self.loginDelegate XMPPManager:self didResponse:(XMPPManagerResponseTypeConnectFail)];
    }
}

//连接服务器成功的方法
-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    //登录
    if (self.connectType == ConnectTypeLogin) {
        NSError *error = nil;
        //向服务器发送密码验证 //验证可能失败或者成功
        [sender authenticateWithPassword:self.password error:&error];
    }
    //注册
    else{
        //向服务器发送一个密码注册（成功或者失败）
        [sender registerWithPassword:self.password error:nil];
    }
}


// 验证账号密码回调--success
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    
    /**
     *  unavailable 离线
     available  上线
     away  离开
     do not disturb 忙碌
     */
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"available"];
    [self.xmppStream sendElement:presence];
    if ([self.loginDelegate respondsToSelector:@selector(XMPPManager:didResponse:)]) {
        [self.loginDelegate XMPPManager:self didResponse:(XMPPManagerResponseTypeAuthenSuccess)];
    }
    
}

// 验证账号密码回调--failure
-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    if ([self.loginDelegate respondsToSelector:@selector(XMPPManager:didResponse:)]) {
        [self.loginDelegate XMPPManager:self didResponse:(XMPPManagerResponseTypeAuthenRegisterFail)];
    }
}


// 注册回调--success
- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    
    if ([self.loginDelegate respondsToSelector:@selector(XMPPManager:didResponse:)]) {
        [self.loginDelegate XMPPManager:self didResponse:(XMPPManagerResponseTypeRegisterSuccess)];
    }

}
// 注册回调--failure
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error {
    
    if ([self.loginDelegate respondsToSelector:@selector(XMPPManager:didResponse:)]) {
        [self.loginDelegate XMPPManager:self didResponse:(XMPPManagerResponseTypeAuthenRegisterFail)];
    }

    
}

@end
