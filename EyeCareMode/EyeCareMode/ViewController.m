//
//  ViewController.m
//  EyeCareMode
//
//  Created by Wusu on 2019/12/3.
//  Copyright © 2019 吴素. All rights reserved.
//

#import "ViewController.h"
#import "EyeCareManage.h"

@interface ViewController ()
/** weak */
@property (nonatomic, weak) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * label = [[UILabel alloc]init];
    self.label = label;
    label.frame = CGRectMake(0, 70, 200, 25);
    label.textColor = [UIColor blackColor];
    
    
    UIButton * btn = [UIButton buttonWithType:0];
    [btn setTitle:@"开启" forState:UIControlStateNormal];
    [btn setTitle:@"关闭" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 120, 200, 25);
    btn.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:label];
    [self.view addSubview:btn];
    [self reload];
    
}

- (void)onClick:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [[EyeCareManage sharedUtil] switchEyeCareMode:sender.selected];
    [self reload];
}

- (void)reload{
    BOOL eyeCare = [[EyeCareManage sharedUtil] queryEyeCareModeStatus];
    self.label.text = [NSString stringWithFormat:@"当前模式--- %@", [NSString stringWithFormat:@"%d",eyeCare]];
}


@end
