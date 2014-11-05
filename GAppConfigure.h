//
//  GAppConfigure.h
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  AppConfig 接口。定义 app 中的相关配置
    包括社交网络账号，用户个人信息，程序界面的字体、字号、颜色等的通用定义
 */

/// 程序用到的相关社交网络账号的定义 相关Key he SecretKey
static NSString *const UmengKey    = @"" ;
static NSString *const ShareSDKKey = @"" ;
static NSString *const QZoneID     = @"" ;
static NSString *const QZoneKey    = @"" ;

///用户相关信息存储字典key
static NSString *const kUser_PhoneKey    = @"User_PhoneKey" ;
static NSString *const kUser_nameKey     = @"User_nameKey";
static NSString *const kUser_NicknameKey = @"User_NicknameKey";
static NSString *const kUser_PasswordKey = @"User_PasswordKey";
static NSString *const kUser_UIDKey      = @"User_UIDKey";
static NSString *const kUser_TokenKey    = @"User_TokenKey";
static NSString *const kUser_AreaCodeKey = @"User_AreaCodeKey";

/// 程序相关常数 App Id、下载地址、评价地址等
static NSString *const AppId = @"593499239";
#define kAppUrl     [NSString stringWithFormat:@"https://itunes.apple.com/us/app/ling-hao-xian/id%@?ls=1&mt=8",kAppId]
#define kRateUrl    [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppId]

///程序全局通知
static NSString *const kReLoginNotification = @"ReLoginNotification" ;

///占位图片
#define kPlaceholderImage [UIImage imageNamed:@"placeholderImage.png"]

/// 常用三级加粗字体字号
#define kB_LargeFont   [UIFont boldSystemFontOfSize:20]
#define kB_MiddleFont  [UIFont boldSystemFontOfSize:18]
#define kB_SmallFont   [UIFont boldSystemFontOfSize:16]
/// 常用三级正常字体字号
#define kN_LargeFont   [UIFont systemFontOfSize:17]
#define kN_MiddleFont  [UIFont systemFontOfSize:15]
#define kN_SmallFont   [UIFont systemFontOfSize:12]
/// 内容部分正常显示颜色和突出显示颜色
#define kNormalColor      [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0   alpha:1]
#define kHighlightColor   [UIColor colorWithRed:0/255.0 green:191/255.0 blue:225/255.0 alpha:1]
/// 几个常用色彩
#define kAppBgColor             [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]
#define kBrownColor             [UIColor colorWithRed:255/255.0 green:133/255.0 blue:0/255.0 alpha:1]
#define kGreenColor             [UIColor colorWithRed:1/255.0 green:209/255.0 blue:1/255.0 alpha:1]
#define kOrangeColor            [UIColor colorWithRed:255/255.0 green:141/255.0 blue:22/255.0 alpha:1]
#define kGrayColor              [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1]
#define kBlackColor             [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1]
#define kRedColor               [UIColor colorWithRed:249/255.0 green:41/255.0 blue:0/255.0 alpha:1]
#define kBlueColor              [UIColor colorWithRed:0/255.0 green:191/255.0 blue:253/255.0 alpha:1]
#define kClearColor             [UIColor clearColor]
#define kWhiteColor             [UIColor whiteColor]
#define kContentBgColor         [UIColor colorWithWhite:0.000 alpha:0.360]