//
//  GNetWorkAPI.h
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  定义所有的网络接口，所有与网络交互的接口，都通过类来定义管理与修改。
 */

///网络请求状态返回码
typedef enum
{
    ORequestStatusSuccess           = 1000,//请求成功
    ORequestStatusUserNotExist      = 1001,//请求失败
    ORequestStatusUserPasswordError = 1002,//用户密码错误(登录时)
    ORequestStatusUserHadExist      = 1003,//用户已存在(注册时)
    ORequestStatusNeedRelogin       = 1004,//需要重新登录，该token已过期
    ORequestStatusClientNeedUpdate  = 1005,//客户端需要升级
    ORequestStatusOtherError        = 1006,//其它错误
}ORequestStatusCode;


///操作系统平台
typedef enum
{
    OiPhone       = 0,
    OiPad         = 1,
    OAndroidPhone = 2,
    OAndroidPad   = 3,
}OOSPlatform;


///线上主站点地址
#define kHostSite         @"http://www.xunmitech.com/xBeaconService/iBeaconService.asmx"

/**
 * user模块接口，与用户相关的接口
 */
///普通登录
#define kLogin            @"user/login"
///注册接口
#define kRegister         @"user/register"
///登出
#define kLogout           @"user/logout"
///获取用户信息
#define kGetUserInfo      @"user/getUserInfo"
///修改个人信息
#define kUpdateUserInfo   @"user/updateUserInfo"
///修改密码
#define kChangePassword   @"user/changePassword"
///找回密码
#define kRetrievePassword @"user/retrievePassword"

#define kGetDetailBeaconInfo      @"GetDetailBeaconInfo"

