//
//  BaseViewController.h
//  仿头条首页
//
//  Created by 邱荣贵 on 2017/10/26.
//  Copyright © 2017年 邱久. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BaseType) {
    BaseType0,
    BaseType1,
    BaseType2
};

@interface BaseViewController : UITableViewController

/** <#name#>*/
@property (nonatomic,assign) BaseType  type;
@end


