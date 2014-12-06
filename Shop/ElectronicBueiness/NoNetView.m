//
//  NoNetView.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "NoNetView.h"
#define NOTICELAYER_ANIMATION_KEY           @"ANoticeLayer ani"

static  NoNetView  *noNetViewManager = nil;

@interface NoNetView ()
{
    UILabel *_title;
    UIButton *_refreshButton;
    BOOL        _add;
}
@end


@implementation NoNetView
+ (NoNetView *)shareNoNetView
{
    static dispatch_once_t      token;
    dispatch_once(&token,^{
        noNetViewManager = [[NoNetView alloc] init];
    });
    return noNetViewManager;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithSelect:(SEL)select withTarget:(id)target targetView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        [self removeFromSuperview];
        self.frame = CGRectMake(0, 40, SCREENWIDTH, SCREENHEIGHT);
        self.backgroundColor = [UIColor whiteColor];
       
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT/2-80, SCREENWIDTH, 50)];
        title.backgroundColor = [UIColor clearColor];
        title.text = @"点击刷新试试";
        title.textAlignment = NSTextAlignmentCenter;
        title.alpha = 0.7;
        [self addSubview:title];
        
        UIImage *icon = [UIImage imageNamed:@"refresh.png"];
        _refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, SCREENWIDTH/2-80, SCREENWIDTH, 50)];
        _refreshButton.backgroundColor = [UIColor clearColor];
        [_refreshButton setImage:icon forState:UIControlStateNormal];
        [_refreshButton addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_refreshButton];
        
    }
    return self;
}

- (void)showInView:(UIView*)view
{
    if (view)
    {
        if (![view viewWithTag:self.tag]) {
            [view addSubview:self];
        }
    }
    self.hidden = NO;
}

- (void)hide
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 0.12;
    scaleAnimation.fillMode = kCAFillModeBackwards;
    scaleAnimation.removedOnCompletion = YES;
    scaleAnimation.delegate = self;
    [self.layer addAnimation:scaleAnimation forKey:NOTICELAYER_ANIMATION_KEY];
    self.hidden = YES;
    [self removeFromSuperview];
}@end
