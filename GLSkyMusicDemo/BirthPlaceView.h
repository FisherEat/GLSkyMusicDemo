//
//  BirthPlaceView.h
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyFadeInView.h"

@interface BirthPlaceView : UIView

/**
 *  飞行视图
 */

//背景图
@property (nonatomic,strong) UIImageView *backgroundImg ;

//名称图
@property (nonatomic,strong) UIImageView *nameImg ;

//标题文字图
@property (nonatomic,strong) UIImageView *titleImg ;

//返回上一页面按钮
@property (nonatomic,strong) UIButton *previewBtn ;

//去下一页面按钮
@property (nonatomic,strong) UIButton *nextBtn ;

//加载视图
-(void)loadView ;

//文字渐变
@property (nonatomic,strong)LazyFadeInView *fadeInView_1 ;
@property (nonatomic,strong)LazyFadeInView *fadeInView_2 ;

@end
