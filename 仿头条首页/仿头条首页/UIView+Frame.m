//
//  UIView+Frame.m
//  HFIDCredit
//
//  Created by yyy－mac on 16/9/19.
//  Copyright © 2016年 minyahui. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setQCenterX:(CGFloat)QCenterX{
 
    CGPoint center = self.center;
    center.x = QCenterX;
    self.center = center;
}
- (CGFloat)QCenterX{
    
    return self.center.x;
}

- (void)setQCenterY:(CGFloat)QCenterY{
    CGPoint center = self.center;
    center.y = QCenterY;
    self.center = center;
}
- (CGFloat)QCenterY{
    return self.center.y;
}
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size
{
    return self.frame.size;
}
-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}



-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}
-(CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}
-(CGFloat)minX
{
    return CGRectGetMinX(self.frame);
}
-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}
-(CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}
-(CGFloat)minY
{
    return CGRectGetMinY(self.frame);
}

@end
