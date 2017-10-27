//
//  UIView+Frame.h
//  HFIDCredit
//
//  Created by yyy－mac on 16/9/19.
//  Copyright © 2016年 minyahui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat QCenterX;
@property (nonatomic,assign) CGFloat QCenterY;

@property (nonatomic,assign,readonly) CGFloat maxX;
@property (nonatomic,assign,readonly) CGFloat midX;
@property (nonatomic,assign,readonly) CGFloat minX;
@property (nonatomic,assign,readonly) CGFloat maxY;
@property (nonatomic,assign,readonly) CGFloat midY;
@property (nonatomic,assign,readonly) CGFloat minY;
@end
