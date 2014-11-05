//
//  TWTextField.m
//  TWApp
//
//  Created by line0 on 13-7-6.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OTextField.h"
#import "GAppDefine.h"
#import "Category.h"

@implementation OTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit
{
    self.layer.cornerRadius = 4;
    self.clipsToBounds = YES;
    self.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.2].CGColor;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1;
    [self setFont:kN_MiddleFont];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }
    
	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }

	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }

	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
	return CGRectInset(CGRectMake(0, 0, 30, self.height), 5, 7);
}

//根据需求自定义输入框背景
//- (void)drawRect:(CGRect)rect
//{
//    UIImage *textFieldBackground = [[UIImage imageNamed:@"text_field_teal.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15.0, 5.0, 15.0, 5.0)];
//    [textFieldBackground drawInRect:[self bounds]];
//}

@end
