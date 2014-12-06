//
//  UIImage+Additions.m
//  ElectronicBueiness
//
//  Created by yao on 14-9-10.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

+ (UIImage*)getStretchableImage:(NSString*) imageName withLeftCap:(float) leftCap withTopCap:(float) topCap
{
    NSAssert(imageName!=nil, @"image nil");
    if (!imageName || [imageName length] == 0)
        return nil;
    UIImage *image = AA_IMAGE(imageName);
    return [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

+ (UIImage*)getMiddleStretchableImage:(NSString*) imageName
{
    UIImage *image = AA_IMAGE(imageName);
    return [UIImage getStretchableImage:imageName withLeftCap:floorf(image.size.width/2) withTopCap:floorf(image.size.height/2)];
}

+ (UIImage*) createImageWithSize: (CGSize)size FromImage: (UIImage*) img
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 0, 0, 0, 1.0f);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    
    CGRect rect = CGRectMake( (size.width - img.size.width)/2,
                             (size.height - img.size.height) /2,
                             img.size.width,
                             img.size.height);
    
    [img drawInRect:rect];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 withRect:(CGPoint)point
{
    UIGraphicsBeginImageContext(image1.size);
    // Draw image1
    [image1 drawInRect:CGRectMake(point.x, point.y, image1.size.width, image1.size.height)];
    // Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
@end
