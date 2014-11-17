//
//  C1.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "C1.h"
#import "C2.h"
#import "Category.h"

@interface C1 ()

@end

@implementation C1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBtn] ;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)addBtn
{
    self.previewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.nextBtn    = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //    self.previewBtn.backgroundColor = [[UIColor tomatoColor] colorWithAlphaComponent:0.55];
    //    self.nextBtn.backgroundColor = [[UIColor tomatoColor] colorWithAlphaComponent:0.55];
    
    CGFloat toValue  = CGRectGetMidX(self.view.bounds) - 482;
    CGFloat toValue1 = CGRectGetMidX(self.view.bounds) + 432;
    
    self.previewBtn.left = toValue;
    self.nextBtn.left    = toValue1;
    
    CGFloat middle  = CGRectGetMidY(self.view.bounds);
    self.previewBtn.top = middle - 25;
    self.nextBtn.top    = middle - 25;
    [self.previewBtn addTarget:self action:@selector(goBackView) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn    addTarget:self action:@selector(goNextView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.previewBtn setImage:[UIImage imageNamed:@"previewBtn"] forState:UIControlStateNormal];
    [self.nextBtn setImage:[UIImage imageNamed:@"nextBtn"] forState:UIControlStateNormal];

    
    [self.view addSubview:self.previewBtn];
    [self.view addSubview:self.nextBtn];
}


- (void)goBackView
{
    [UIView animationFade:self.navigationController.view];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goNextView
{
    [UIView animationFade:self.navigationController.view];
    [self.navigationController pushViewController:[[C2 alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
