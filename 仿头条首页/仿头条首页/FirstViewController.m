//
//  FirstViewController.m
//  仿头条首页
//
//  Created by 邱荣贵 on 2017/10/26.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "UIView+Frame.h"

#import "BaseViewController.h"
#import "BaseViewController1.h"
#import "BaseViewController2.h"

#import "FirstViewController.h"

#import "qrg.h"

@interface FirstViewController ()<UIScrollViewDelegate>{
    
    UIButton *tempBut;
}

/** <#name#>*/
@property (nonatomic,strong) UIScrollView  *baskScrollView;

/** 顶部 titleView*/
@property (nonatomic,weak) UIView  * topView;

/** topView 下划线*/
@property (nonatomic,weak) UIView  *underLindView;

@end

@implementation FirstViewController

//- (UIScrollView *)baskScrollView{
//    if(!_baskScrollView){
//        
//        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//        scrollView.delegate = self;
//        scrollView.pagingEnabled = YES;
//        scrollView.bounces = NO;
//        [self.view addSubview:scrollView];
//        
//        _baskScrollView = scrollView;
//    }
//    return _baskScrollView;
//}

//- (UIView *)topView{
//    if(!_topView){
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, titleButtonH)];
//        view.backgroundColor = [UIColor blackColor];
//        view.alpha = .6;
//        [self.view addSubview:view];
//        
//        _topView = view;
//    }
//    return _topView;
//}

//- (UIView *)underLindView{
//    if(!_underLindView){
//        UIView *lineView = [[UIView alloc] init];
//        lineView.backgroundColor = [UIColor redColor];
//        [_topView addSubview:lineView];
//        
//        _underLindView = lineView;
//    }
//    return _underLindView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self addChildViewController];
    
    [self setUI];
    
}


/**
 添加子控制器
 */
- (void)addChildViewController{
    
    BaseViewController *base1 = [[BaseViewController alloc] init];
    base1.navigationItem.title = @"北京";
    [self addChildViewController:base1];
    
    BaseViewController1 *base2 = [[BaseViewController1 alloc] init];
    base2.navigationItem.title = @"上海";
    [self addChildViewController:base2];

    BaseViewController2 *base3 = [[BaseViewController2 alloc] init];
    base3.navigationItem.title = @"广州";
    [self addChildViewController:base3];

}

- (void)setUI{
    
    __block typeof(self) weakSelf = self;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.scrollsToTop = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    self.baskScrollView = scrollView;
    self.baskScrollView.contentSize = CGSizeMake(WIDTH * self.childViewControllers.count, HEIGHT);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, titleButtonH)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = .6;
    [self.view addSubview:view];
    self.topView = view;

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor redColor];
    lineView.height = 2;
    lineView.y = self.topView.height - 2;
    [self.topView addSubview:lineView];
    self.underLindView = lineView;

    CGFloat w = WIDTH / self.childViewControllers.count;
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIViewController *vc = obj;
        
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.tag = idx;
        but.titleLabel.backgroundColor = [UIColor cyanColor];
        but.frame = CGRectMake(w * idx, 0, w, titleButtonH - 4);
        but.backgroundColor = QRGRandomColor;
        [but setTitle:vc.navigationItem.title forState:UIControlStateNormal];
        [but addTarget:self action:@selector(clike:) forControlEvents:UIControlEventTouchUpInside];
        [weakSelf.topView addSubview:but];
        
        if(idx == 0){
            
            [but.titleLabel sizeToFit];
            
            [self clike:but];
            
            tempBut = but;
        }
    }];
    
}

- (void)clike:(UIButton *)sends{
    
    
    [self.baskScrollView setContentOffset:CGPointMake(WIDTH * sends.tag, 0) animated:YES];
    
    [self changeViewControllerWithIndex:sends.tag];
    
    if(tempBut == sends){
        
        [[NSNotificationCenter defaultCenter]postNotificationName:TopTitleButtonAgainClike object:nil];
    }
    tempBut = sends;
}

- (void)changeViewControllerWithIndex:(NSInteger)aIndex{
    
    UIButton *but = self.topView.subviews[aIndex + 1];
    

    [UIView animateWithDuration:.3 animations:^{
        
        self.underLindView.width = but.titleLabel.width;
        self.underLindView.QCenterX = but.QCenterX;
        
    } completion:^(BOOL finished) {
        
        UIViewController *VC = self.childViewControllers[but.tag];
        
        if(VC.view.window) return ;
        
        VC.view.frame = CGRectMake(self.baskScrollView.width * aIndex, 0, self.baskScrollView.width, self.baskScrollView.height);
        [self.baskScrollView addSubview:VC.view];
    }];

    
    for(int i = 0 ;i < self.childViewControllers.count; i++){
        
        UIViewController *vc = self.childViewControllers[i];
        
        if(![vc isViewLoaded]) return;
        
        if([vc.view isKindOfClass:[UIScrollView class]]){
            
            UIScrollView *scro = (UIScrollView *)vc.view;
            scro.scrollsToTop = aIndex == i;
            NSLog(@"%d--scro---333",scro.scrollsToTop);

        }
        
    }
    

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger off = scrollView.contentOffset.x / scrollView.width;
    
    [self changeViewControllerWithIndex:off];
    
}

@end
