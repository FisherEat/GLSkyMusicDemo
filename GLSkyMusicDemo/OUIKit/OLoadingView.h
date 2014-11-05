//
//  OLoadingView.h
//  CJSX
//
//  Created by 何振东 on 14-6-4.
//  Copyright (c) 2014年 CJTX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKit.h"

/**
 *  加载等待页面。
 */
@interface OLoadingView : UIView
/// 提示文字
@property (strong, nonatomic) OLabel *textLbl;

/// 指示进度条
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;

+ (instancetype)sharedInstance;

/// 显示和隐藏等等视图
- (void)showLoadingView;
- (void)hideLoadingView;

@end
