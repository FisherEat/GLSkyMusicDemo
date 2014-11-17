//
//  BirthPlaceView.m
//  GLSkyMusicDemo
//
//  Created by Apple on 14-11-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "BirthPlaceView.h"
#import "pop.h"
#import "BlocksKit.h"
#import "Category.h"

@implementation BirthPlaceView

/**
 *  initWithFrame 这个函数是用来初始化并且返回一个新的视图对象，其他UI也有init方法，此处以UIView 为例，
 实际编程中，我们如果用Interface Builder 方式创建了UIView对象。（也就是，用拖控件的方式）
 那么，initWithFrame方法方法是不会被调用的。因为nib文件已经知道如何初始化该View。
 （因为，我们在拖该view的时候，就定义好了长、宽、背景等属性）。
 这时候，会调用initWithCoder方法，我们可以用initWithCoder方法来重新定义我们在nib中已经设置的各项属性。
 
 所以就是当我们定义好一个UIView 并且准备手动编码的时候。就是我们声明一个UIView的子类，进行“手工”编写代码的方式。此时我们使用initWithFrame 方法
 
 实际编程中，我们使用编程方式下，来创建一个UIView或者创建UIView的子类。这时候，将调用initWithFrame方法，来实例化UIView。
 特别注意，如果在子类中重载initWithFrame方法，必须先调用父类的initWithFrame方法。在对自定义的UIView子类进行初始化操作。
 *
 *  @param frame 给定的指定的尺寸
 *
 *  @return 返回我们重新设计的UIView
 */
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame ];//先调用父类的initwithframe方法
    if (self) {
        //再定义该类的初始化操作
        [self loadView] ;
        //block对于其变量都会形成strong reference，对于self也会形成strong reference ，而如果self本身对block也是 strong reference 的话，就会形成 strong reference 循环，造成内存泄露，为了防止这种情况发生，在block外部应该创建一个week（__block） reference。所以在block内如果有self的话，一般都会在block外面加一句_block typeof(self) wself = self;
        __block typeof(self) wself = self ;
        [self bk_performBlock:^(id obj) {
            [wself showAnimation] ;
        } afterDelay:2.0f] ;
        [self addBtn] ;
    }
    
    return self ;
}

-(void)loadView
{
    //self 是调用backgroundImg的 setter 方法嘛，呵呵
    self.backgroundImg  = [[UIImageView alloc]initWithFrame:self.frame];
    self.backgroundImg.image = [UIImage imageNamed:@"Birthplace_0"] ;
    //self 是调用UIView 的setter方法嘛，呵呵
    [self addSubview:self.backgroundImg];
    
    self.nameImg = [[UIImageView alloc]initWithFrame:CGRectMake(-1024, 0, 1024, 894/2)];
    self.nameImg.image = [UIImage imageNamed:@"Birthplace_1"] ;
    [self addSubview: self.nameImg] ;
    
    self.titleImg = [[UIImageView alloc]initWithFrame:CGRectMake(30, 508, 854/2, 377/2)];
    self.titleImg.image = [UIImage imageNamed:@"Birthplace_2"] ;
    [self addSubview:self.titleImg] ;
    
    self.fadeInView_1 = [[LazyFadeInView alloc]init];
    self.fadeInView_1.frame = CGRectMake(50, 528, 854/2-50, 377/2);
    self.fadeInView_1.backgroundColor = [UIColor clearColor] ;
    self.fadeInView_1.textColor = [UIColor colorWithRed:199/255. green:233/255. blue:143/255. alpha:1.];
    self.fadeInView_1.textFont = [UIFont fontWithName:@"FZZDXJW-GB1-0" size:25.0];
    [self addSubview:self.fadeInView_1] ;
    
    self.fadeInView_2 = [[LazyFadeInView alloc] init];
    self.fadeInView_2.frame = CGRectMake(50, 598, 854/2 - 50, 377/2);
    self.fadeInView_2.backgroundColor = [UIColor clearColor];
    self.fadeInView_2.textColor = [UIColor colorWithRed:199/255.0 green:232/255.0 blue:143/255.0 alpha:1.0];
    self.fadeInView_2.textFont = [UIFont fontWithName:@"FZZDXJW-GB1-0" size:25.0f];
    [self addSubview:self.fadeInView_2];
    
    self.fadeInView_1.text = @"    让人们能够自由飞翔，千里山川变通途，万里重洋一日还，是我们飞机家族共同的追求。我特别感谢心怀飞行梦想的人们，是飞行的梦想造就了我，我的出世、进化和成长，人类都付出了卓绝的努力，是梦想的力量一路引领我向前。";
    self.fadeInView_2.text = @"    因领导了波音747 的研发而闻名于世的传奇航空工程师乔?萨特说过：“最好的飞机其实是人类思维和梦想的表达。无数人用创造力、精力和梦想创造了这些全世界予以信赖的民用飞机，而我非常幸运能与他们相识并共事。";
    
    
}
-(void)showAnimation
{
    CGFloat toValue = CGRectGetMidY(self.frame) + 130 ;
    POPSpringAnimation *dropAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX] ;
    dropAnimation.toValue = @(toValue);
    dropAnimation.springBounciness = 12.f ;
    CGFloat toValue1 = CGRectGetMidX(self.frame) + 100 ;
    POPSpringAnimation *riseAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY] ;
    riseAnimation.toValue = @(toValue1);
    riseAnimation.springBounciness = 20.f ;
    
    [self.nameImg.layer pop_addAnimation:dropAnimation forKey:@"dropAnimation"] ;
    [dropAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        //         [self.titleView.layer pop_addAnimation:riseAnimation forKey:@"riseAnimation"];
    }];
    
}

-(void)addBtn
{
    self.previewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.nextBtn    = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    //    self.previewBtn.backgroundColor = [[UIColor tomatoColor] colorWithAlphaComponent:0.55];
    //    self.nextBtn.backgroundColor = [[UIColor tomatoColor] colorWithAlphaComponent:0.55];
    
    CGFloat toValue  = CGRectGetMidX(self.frame) - 482;
    CGFloat toValue1 = CGRectGetMidX(self.frame) + 432;
    
    self.previewBtn.left = toValue;
    self.nextBtn.left    = toValue1;
    
    CGFloat middle  = CGRectGetMidY(self.frame);
    self.previewBtn.top = middle - 25;
    self.nextBtn.top    = middle - 25;
    
    [self addSubview:self.previewBtn];
    [self addSubview:self.nextBtn];

}
@end
