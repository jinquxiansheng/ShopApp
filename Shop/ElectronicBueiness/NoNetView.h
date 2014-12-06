//
//  NoNetView.h
//  ElectronicBueiness
//
//  Created by yao on 14-9-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kLayerRect  CGRectMake(0.0, 0.0, 320.0, 120.0)

@interface NoNetView : UIView
- (id)initWithSelect:(SEL)select withTarget:(id)target targetView:(UIView *)view;
- (void)showInView:(UIView*)view;
- (void)hide;
@end
