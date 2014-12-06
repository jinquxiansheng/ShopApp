//
//  AdImageView.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "AdImageView.h"

@implementation AdImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
           }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
       
        UIImage  *ad = [UIImage imageNamed:@"ad.png"];
        self.image = ad;
        self.frame = CGRectMake(0, 0, ad.size.width, ad.size.height);
        [WINDOW addSubview:self];
    }
    return self;
}
- (void)show
{
    __weak   AdImageView   *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = [NSNumber numberWithFloat:1.0];
        animation.toValue = [NSNumber numberWithFloat:0];
        animation.duration = .7;
        animation.removedOnCompletion = YES;
        animation.delegate = self;
        animation.fillMode = kCAFillModeBackwards;
        [weakSelf.layer addAnimation:animation forKey:@"ad"];
    });
    
}
- (void)animationDidStart:(CAAnimation *)anim;
{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
    self.hidden = YES;
    [self removeFromSuperview];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
