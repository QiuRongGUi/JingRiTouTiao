//
//  qrg.h
//  仿头条首页
//
//  Created by 邱荣贵 on 2017/10/26.
//  Copyright © 2017年 邱久. All rights reserved.
//

#ifndef qrg_h
#define qrg_h

#define WEAKSELF  __weak typeof(self) weakSelf = self;

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define QRGRandomColor [UIColor colorWithRed:arc4random_uniform(255)/256.0 green:arc4random_uniform(255)/256.0 blue:arc4random_uniform(255)/256.0 alpha:1]

#define titleButtonH 44

/** 标题栏监听侧重复点击*/
#define TopTitleButtonAgainClike @"TopTitleButtonAgainClike"

#define QRGTabBarControllerAgainClike @"QRGTabBarControllerAgainClike"

#endif /* qrg_h */
