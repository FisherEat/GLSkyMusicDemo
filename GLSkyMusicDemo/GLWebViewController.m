//
//  GLWebViewController.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-6.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "GLWebViewController.h"
#import "Category.h"

@interface GLWebViewController ()

//返回上一页按钮
@property (nonatomic,strong) UIButton *previewBtn ;
@end

@implementation GLWebViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ;
    if (self) {
        //custom here
    }
    
    return self ;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addBtn];
    
    NSURL *url = [NSURL URLWithString:[self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
                  
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES ;
}


-(void)addBtn
{
    self.previewBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)] ;
    [self.previewBtn setImage:[UIImage imageNamed:@"previewBtn"] forState:UIControlStateNormal] ;
    self.previewBtn.left = CGRectGetMidX(self.view.frame) - 482 ;
    self.previewBtn.top = CGRectGetMidY(self.view.frame) ;
    [self.view addSubview:self.previewBtn] ;
    [self.previewBtn addTarget:self action:@selector(goBackView) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)goBackView
{
    [UIView animationFade:self.navigationController.view];
    [self.navigationController popViewControllerAnimated:YES];
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
