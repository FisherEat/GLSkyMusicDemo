//
//  BirthPlaceVC.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "BirthPlaceVC.h"
#import "C1.h"
#import "Category.h"

@interface BirthPlaceVC ()

@end

@implementation BirthPlaceVC

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ;
    if (self) {
        //Custom initialization here ;
    }
    return self ;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addHomePage] ;
    [self.birthView.previewBtn addTarget:self action:@selector(goBackView) forControlEvents:UIControlEventTouchUpInside];
    [self.birthView.nextBtn addTarget:self action:@selector(goNextView) forControlEvents:UIControlEventTouchUpInside];
    [self.birthView.previewBtn setImage:[UIImage imageNamed:@"previewBtn"] forState:UIControlStateNormal];
    [self.birthView.nextBtn setImage:[UIImage imageNamed:@"nextBtn_blue"] forState:UIControlStateNormal] ;
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES ;
}
-(void)addHomePage
{
    CGRect rect = CGRectMake(0, 0, 1024, 768) ;
    self.birthView = [[BirthPlaceView alloc]initWithFrame:rect] ;
    [self.view insertSubview:self.birthView atIndex:0] ;
    
}

-(void)goBackView
{
    [UIView animationFade:self.navigationController.view] ;
    [self.navigationController popViewControllerAnimated:YES] ;
}

-(void)goNextView
{
    [UIView animationFade:self.navigationController.view];
    [self.navigationController pushViewController:[[C1 alloc]init] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
