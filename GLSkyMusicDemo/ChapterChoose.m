//
//  ChapterChoose.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "ChapterChoose.h"
#import "Category.h"
#import "ChapterTwoVC.h"
#import "BirthPlaceVC.h"

@interface ChapterChoose ()<CFCoverFlowViewDelegate>

@property (nonatomic,strong) CFCoverFlowView *myView ;

@end

@implementation ChapterChoose

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chapterBg"]];
    bgView.frame = CGRectMake(0, 0, 1024, 900);
    [self.view addSubview:bgView];
    
    CGRect rect  = CGRectMake(0, 178, 1024, 389);
    self.myView = [[CFCoverFlowView alloc]initWithFrame:rect];
    [self.view addSubview:self.myView];
    
    self.myView.delegate = self;
    self.myView.pageItemWidth = 600 ;
    self.myView.pageItemHeight = 400 ;
    self.myView.pageItemCoverWidth = 15.0 ;
    self.myView.pageItemCornerRadius = 15.0;
    [self.myView setPageItemsWithImageNames:@[@"chapter1",@"chapter2",@"back"]] ;
    
    // Do any additional setup after loading the view from its nib.
}

-(void)coverFlowView:(CFCoverFlowView *)coverFlowView didScrollPageItemToIndex:(NSInteger)index
{
    
}

-(void)coverFlowView:(CFCoverFlowView *)coverFlowView didSelectPageItemAtIndex:(NSInteger)index
{
    if (index == 0) {
        [UIView animationFade:self.navigationController.view];
        [self.navigationController pushViewController:[[BirthPlaceVC alloc]init] animated:YES] ;
        
    }
    else if(index == 1)
    {
        [UIView animationFade:self.navigationController.view] ;
        [self.navigationController pushViewController:[[ChapterTwoVC alloc]init]  animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
