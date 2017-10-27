//
//  BaseViewController.m
//  仿头条首页
//
//  Created by 邱荣贵 on 2017/10/26.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "BaseViewController.h"

#import "MJRefresh.h"

#import "qrg.h"

@interface BaseViewController ()

/** <#name#>*/
@property (nonatomic,strong) NSMutableArray  *data;

@end

@implementation BaseViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.contentInset  = UIEdgeInsetsMake(64 + titleButtonH, 0, 49, 0);
    
    self.data = [NSMutableArray array];

    
    [self setRefresh];
    
    
    WEAKSELF;
    
    /** 拿到 topTitle 点击事件*/
    [[NSNotificationCenter defaultCenter]addObserverForName:TopTitleButtonAgainClike object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
      
        [weakSelf clikeAgain];
      
    }];
    
    /** 拿到 QRGTabBarController 点击事件*/
    [[NSNotificationCenter defaultCenter]addObserverForName:QRGTabBarControllerAgainClike object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        [weakSelf clikeAgain];

    }];
}

- (BaseType)type{
    
    return BaseType0;
}

/**
 处理通知事件
 */
- (void)clikeAgain{
    
    if(!self.view.window) return ;
    
    if(!self.tableView.scrollsToTop) return ;
    [self setRefresh];

}

/**
 刷新事件
 */
- (void)setRefresh{
    
    WEAKSELF;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}
- (void)loadData{
    
    for(int i = 0 ; i< 20;i ++){

        NSString *str = [NSString stringWithFormat:@"%d--%@ -- %ld",i,self.navigationItem.title,self.type];
        [self.data addObject:str];
    }

    NSLog(@"%ld---count",self.data.count);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Cell = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--小兵",indexPath.row];
    
    return cell;
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:TopTitleButtonAgainClike object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:QRGTabBarControllerAgainClike object:nil];

}

@end
