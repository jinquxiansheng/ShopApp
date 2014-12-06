//
//  UIImage+Additions.h
//  ElectronicBueiness
//
//  Created by yao on 14-9-10.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define AA_IMAGE(name) [UIImage imageNamed:name]

@interface UIImage (Additions)
+ (UIImage*)getStretchableImage:(NSString*)imageName withLeftCap:(float)leftCap withTopCap:(float)topCap;
+ (UIImage*)getMiddleStretchableImage:(NSString*) imageName;
+ (UIImage*)createImageWithSize: (CGSize)size FromImage: (UIImage*) img;
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 withRect:(CGPoint)point;
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
