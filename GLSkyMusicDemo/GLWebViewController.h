//
//  GLWebViewController.h
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-6.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,strong) NSString *urlString ;

@end

