//
//  GLHomeVC.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "GLHomeVC.h"
#import "Category.h"

@interface GLHomeVC ()<UIAlertViewDelegate>
@property (strong, nonatomic) UIImageView *img1;
@property (strong, nonatomic) UIImageView *img2;
@property (strong, nonatomic) UIImageView *img3;

@end

@implementation GLHomeVC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, 1024, 768);
    UIImageView *img = [[UIImageView alloc] initWithFrame:rect];
    img.image = [UIImage imageNamed:@"bg-1"];
    [self.view addSubview:img];
    
    [self addMusicView];
    [self addBtn];
    
}


- (void)addMusicView
{
    self.img1 = [[UIImageView alloc] initWithFrame:CGRectMake(220, 60, 308/2,  565/2)];
    self.img2 = [[UIImageView alloc] initWithFrame:CGRectMake(500, 118, 162/2,  181/2)];
    self.img3 = [[UIImageView alloc] initWithFrame:CGRectMake(720, 160,  91/2,  162/2)];
    
    self.img1.image = [UIImage imageNamed:@"music1"];
    self.img3.image = [UIImage imageNamed:@"music2"];
    self.img2.image = [UIImage imageNamed:@"music3"];
    
    self.img1.left = 250;
    self.img2.left = self.img1.right + 120;
    self.img3.left = self.img2.right + 120;
    
    [self.view addSubview:self.img1];
    [self.view addSubview:self.img2];
    [self.view addSubview:self.img3];
}


- (void)addBtn
{
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(250, 515, 333, 199)];
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(20,  20, 333, 199)];
    self.btn3 = [[UIButton alloc] initWithFrame:CGRectMake(20,  20, 333, 199)];
    self.btn4 = [[UIButton alloc] initWithFrame:CGRectMake(20,  20, 333, 199)];
    
    self.btn2.left = self.btn1.right + 200;
    self.btn2.top  = self.btn1.top;
    
    self.btn3.left = self.btn1.left;
    self.btn3.top  = self.btn1.bottom - 80;
    
    self.btn4.left = self.btn2.left;
    self.btn4.top  = self.btn3.top;
    
    self.btn1.left = -200;
    self.btn2.left = 1400;
    
    self.btn1.showsTouchWhenHighlighted = NO;
    self.btn2.showsTouchWhenHighlighted = NO;
    self.btn3.showsTouchWhenHighlighted = NO;
    self.btn4.showsTouchWhenHighlighted = NO;
    
    [self.btn1 setImage:[UIImage imageNamed:@"profile"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"enter"] forState:UIControlStateNormal];
    [self.btn3 setImage:[UIImage imageNamed:@"story"] forState:UIControlStateNormal];
    [self.btn4 setImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
    
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    [self.view addSubview:self.btn4];
    
    [self.btn2 addTarget:self action:@selector(goNextView)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn1 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn3 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn4 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
}


- (void)goNextView
{
//    [UIView animationRippleEffect:self.navigationController.view];
//    [self.navigationController pushViewController:[[ChapterChooseVC alloc] init] animated:YES];
}

- (void)goWebView:(UIButton *)btn
{
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (status == 0 || status == -1)
//        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                                message:@"网络连接异常"
//                                                               delegate:self
//                                                      cancelButtonTitle:@"知道了"
//                                                      otherButtonTitles: nil];
//            [alertView show];
//            [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
//        }
//        else
//        {
//            SMWebviewController *web = [[SMWebviewController alloc] init];
//            //网络正常
//            if (btn == self.btn1)
//            {
//                web.urlStr = @"http://115.29.5.2/kongzhongyinfu/contact.html";
//            }
//            
//            if (btn == self.btn3)
//            {
//                web.urlStr = @"http://115.29.5.2/kongzhongyinfu/story.html";
//            }
//            
//            if (btn == self.btn4)
//            {
//                web.urlStr = @"http://item.taobao.com/item.htm?spm=a230r.1.14.10.BeYEnr&id=40378984636&ns=1#detail";
//            }
//            [self.navigationController pushViewController:web animated:YES];
//            [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
//        }
//    }];
}

@end
