//
//  XMPPManager.h
//  XMPPDemo
//
//  Created by 邵佳杰 on 2017/11/6.
//  Copyright © 2017年 邵佳杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMPPManager;

typedef NS_ENUM(NSInteger,ConnectType){
    ConnectTypeLogin,
    ConnectTypeRegister,
};


/*  000     连接失败
    001     连接成功，验证、注册失败
    011     验证成功
    101     注册成功
*/
typedef NS_ENUM(NSInteger,XMPPManagerResponseType){
    XMPPManagerResponseTypeConnectFail = 0,
    XMPPManagerResponseTypeAuthenRegisterFail = 1,
    XMPPManagerResponseTypeAuthenSuccess = 3,
    XMPPManagerResponseTypeRegisterSuccess = 5,
};

@protocol   XMPPManagerProtocol<NSObject>
@required
- (void) XMPPManager:(XMPPManager *)manager didResponse:(XMPPManagerResponseType)responseType;

@end

@interface XMPPManager : NSObject<XMPPStreamDelegate>
//通信管道，输入输出流
@property(nonatomic,strong)XMPPStream *xmppStream;

@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,assign) ConnectType connectType;

@property (nonatomic,weak) id<XMPPManagerProtocol> loginDelegate;

//单例方法
+(XMPPManager *)defaultManager;
//登录的方法
-(void)loginwithName:(NSString *)userName andPassword:(NSString *)password;
//注册
-(void)registerWithName:(NSString *)userName andPassword:(NSString *)password;
-(void)logout;
@end

