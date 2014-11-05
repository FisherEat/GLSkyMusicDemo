//
//  OLoadingView.m
//  CJSX
//
//  Created by 何振东 on 14-6-4.
//  Copyright (c) 2014年 CJTX. All rights reserved.
//

#import "OLoadingView.h"
#import "Category.h"
#import "GAppDefine.h"

@interface OLoadingView ()
@property (strong, nonatomic) UIToolbar *contentView;

@end

@implementation OLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.2];
        
        self.contentView = [[UIToolbar alloc] initWithFrame:CGRectMake((self.width - 140)/2, 120, 140, 140)];
        [self addSubview:self.contentView];
        
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.indicatorView startAnimating];
        self.indicatorView.frame = CGRectMake((self.contentView.width - 35)/2, 30, 35, 45);
        self.indicatorView.color = kBlackColor;
        [self.contentView addSubview:self.indicatorView];
        
        self.textLbl = [[OLabel alloc] initWithFrame:CGRectMake(0, self.contentView.height - 65, self.contentView.width, 60)];
        self.textLbl.text = @"加载中...";
        self.textLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLbl];
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static OLoadingView *loadingView = nil;
    if (!loadingView) {
        loadingView = [[OLoadingView alloc] initWithFrame:mKeyWindow.bounds];
        loadingView.top = 64;
        [mKeyWindow addSubview:loadingView];
    }
    return loadingView;
}

- (void)showLoadingView
{
    self.alpha = 1;
}

- (void)hideLoadingView
{
    self.alpha = 0.0;
}


@end
