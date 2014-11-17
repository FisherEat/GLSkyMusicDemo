//
//  GLHomeVC.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-5.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "GLHomeVC.h"
#import "VWWWaterView.h"
#import "Category.h"
#import "BlocksKit.h"
#import "pop.h"
#import "GLWebViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "ChapterChoose.h"


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
    
    VWWWaterView *waterView = [[VWWWaterView alloc]initWithFrame:rect];
    [self.view addSubview:waterView];
    
    [self addMusicView];
    [self drawPlane] ;
    [self bk_performBlock:^(id obj)
     {
         [self addBtn];
     }
               afterDelay:1.0f];

    
}

#pragma mark - 隐藏导航栏

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES ;
}

#pragma mark - 添加音乐五线谱视图

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

#pragma mark - 飞机动画
-(void)drawPlane
{
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(1024, 0, 100, 100)];
    self.imgView.image = [UIImage imageNamed:@"plane"] ;
    [self.view addSubview:self.imgView];
    
    CGPoint fromPoint = CGPointMake(1024, 400) ;
    CGPoint toPoint   = CGPointMake(-100, 500);
    CGPoint middlePoint = CGPointMake(800, 300);
    CGPoint middlePoint_1   = CGPointMake(500, 200) ;
    
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];
    movePath.lineCapStyle = kCGLineCapRound ;
    movePath.lineJoinStyle = kCGLineCapRound ;
    [movePath addCurveToPoint:toPoint controlPoint1:middlePoint controlPoint2:middlePoint_1];
    [[UIColor whiteColor]setStroke];
    
    CAKeyframeAnimation *moveAnimation = [ CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = movePath.CGPath ;
    moveAnimation.removedOnCompletion = NO ;
    moveAnimation.duration = 50 ;
    moveAnimation.repeatCount = 100 ;
    
    [self.imgView.layer addAnimation:moveAnimation forKey:nil] ;
}

#pragma mark - 添加四个按钮

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
    
    CGFloat toValue                    = CGRectGetMidX(self.view.bounds) * 0.6;
    CGFloat toValue1                   = CGRectGetMidX(self.view.bounds) * 1.4;
    POPSpringAnimation *leftAnimation  = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    leftAnimation.toValue              = @(toValue);
    leftAnimation.springBounciness     = 12.0f;
    POPSpringAnimation *rightAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    rightAnimation.toValue             = @(toValue1);
    rightAnimation.springBounciness    = 12.0f;
    [self.btn1.layer pop_addAnimation:leftAnimation  forKey:@"leftAnimation"];
    [self.btn3.layer pop_addAnimation:leftAnimation  forKey:@"leftAnimation"];
    [self.btn2.layer pop_addAnimation:rightAnimation forKey:@"rightAnimation"];
    [self.btn4.layer pop_addAnimation:rightAnimation forKey:@"rightAnimation"];

    
    [self.btn2 addTarget:self action:@selector(goNextView)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn1 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn3 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
    [self.btn4 addTarget:self action:@selector(goWebView:)  forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - go to next view \web view
- (void)goNextView
{
    [UIView animationRippleEffect:self.navigationController.view];
    [self.navigationController pushViewController:[[ChapterChoose alloc] init] animated:YES];
}

- (void)goWebView:(UIButton *)btn
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == 0 || status == -1)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"网络连接异常"
                                                               delegate:self
                                                      cancelButtonTitle:@"知道了"
                                                      otherButtonTitles: nil];
            [alertView show];
            [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
        }
        else
        {
            GLWebViewController *web = [[GLWebViewController alloc] init];
            //网络正常
            if (btn == self.btn1)
            {
                web.urlString = @"http://115.29.5.2/kongzhongyinfu/contact.html";
            }
            
            if (btn == self.btn3)
            {
                web.urlString = @"http://115.29.5.2/kongzhongyinfu/story.html";
            }
            
            if (btn == self.btn4)
            {
                web.urlString = @"http://item.taobao.com/item.htm?spm=a230r.1.14.10.BeYEnr&id=40378984636&ns=1#detail";
            }
            [self.navigationController pushViewController:web animated:YES];
            [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
        }
    }];
}

@end
