//
//  GViewController.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "GViewController.h"
#import "GAppDefine.h"
#import "Category.h"
#import "OLoadingView.h"
#import "GLHomeVC.h"

@implementation GViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = kWhiteColor;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self showHomeButton];
    }
}

- (void)showHomeButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"goHome"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backToHome) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(25, 20, 50, 50);
    [self.view addSubview:btn];
}


- (void)hideNavigationBarBackground
{
    //去掉导航栏的原生背景
    for (UIView *view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
        {
            for (CALayer *layer in view.layer.sublayers)
            {
                layer.hidden = YES;
            }
        }
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backToHome
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

