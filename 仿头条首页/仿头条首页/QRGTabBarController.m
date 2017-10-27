//
//  QRGTabBarController.m
//  仿头条首页
//
//  Created by 邱荣贵 on 2017/10/27.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGTabBarController.h"

#import "qrg.h"

@interface QRGTabBarController ()<UITabBarControllerDelegate>{
    
    
    /** 默认的 selectedIndex */
    NSInteger tempIndex;
}

@end

@implementation QRGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.delegate = self;
    
    tempIndex = 0;
    

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if(tempIndex == tabBarController.selectedIndex){
        
        [[NSNotificationCenter defaultCenter]postNotificationName:QRGTabBarControllerAgainClike object:nil];
        
    }
    
    tempIndex = tabBarController.selectedIndex;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
