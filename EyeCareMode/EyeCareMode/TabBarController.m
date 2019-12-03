//
//  TabBarController.m
//  EyeCareMode
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "TabBarController.h"
#import "EyeCareManage.h"
#import "ViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController * vcN = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.viewControllers = @[vcN];
    
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    [self startEyeCareMode];
}

- (void)startEyeCareMode
{
    /****开启与关闭护眼模式*/
    
    // 护眼模式配置
    //[[EyeCareManage sharedUtil] switchEyeCareMode:YES];
    if ([[EyeCareManage sharedUtil] queryEyeCareModeStatus]) {
        [[EyeCareManage sharedUtil] switchEyeCareMode:YES];
    }
}


@end
