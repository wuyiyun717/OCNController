//
//  yueshi.h
//  yueshi
//
//  Created by sm on 14-9-10.
//  Copyright (c) 2014年 lab. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RequestListener <NSObject>


- (void)onOpen;
- (void)onMessage:(NSString *)message;
- (void)onClose;
- (void)onError:(NSString *)error;

@end


@interface yueshi : NSObject 


//实例化工具类。
//sdkkey:"YUESHIIDHL1JK7HJIK"
- (void)InteControlHelper:(NSString *)userID
                   sdkkey:(NSString *)sdkKey;

//1.1.2 setMobileUser
//设置阅视用户名。
//函数原型
//[in] userID：阅视用户名
- (void) setMobileUser:(NSString *)userID;

//启动客户端连接服务器。
//函数原型：
- (void)open;

//1.1.4 isOpened
//判断客户端连接服务器是否成功。
//函数原型：
- (BOOL) isOpened;

//获取被绑定的设备名称列表，通过调用onMessage回调函数返回结果.
//函数原型：
- (void)getBindedStb;//:(NSString *)userID;

//关闭客户端与服务器的连接。
//函数原型：
- (void)close;

//1.1.4 isOpened
//判断客户端连接服务器是否成功。
//函数原型：
- (BOOL) isClosed;

//1.1.5 bindStb
//绑定指定的机顶盒设备。
//函数原型：
//参数：
//[in] mac：机顶盒MAC。
//[in] userID：用户名。
- (void)bindStb:(NSString *)stbid;
         //UserID:(NSString *)userID;

//取消与指定机顶盒的绑定关系。
//函数原型：
//参数：
//[in] mac：机顶盒MAC。
//[in] userID：用户名。
- (void)unBindStb:(NSString *)stbid;
           //UserID:(NSString *)userID;

//设置动作完成响应接口实例对象。
//函数原型：
//参数：
//[in] listener：整体流程响应接口实例对象。
- (void)setListener:(id<RequestListener>)listener;

//发送遥控指令。
//函数原型：
//[in] Stb： 被遥控的机顶盒名称
//[in] action：action 执行非直接切换频道操作；switch切换到actionValue对应的频道
//[in] actionValue：
//action：action时，actionValue的参数：up 向上；down 向下；left向左；right向右；ok 确认；query 查询机顶盒状态;vup 加音量；vdown减音量；epg 导视；vod 点播；quit退出；back 返回；mute 静音/取消静音;
//action：switch时，actionValue的参数：数字字符串 被切换到的频道号；null 执行action对应的焦点上下左右移动或确认
- (void)sendAction:(NSString *)Stb
            Action:(NSString *)action
             Value:(NSString *)actionValue;

//打印日志开关
//@"LOG_ON"
- (void)setLogFlag:(NSString *)flag;

@end




