//
//  ViewController.m
//  LYSLoadingButton
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "ViewController.h"
#import "LYSLoadingButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    LYSLoadingButton *_btn = [[LYSLoadingButton alloc]initWithFrame:CGRectMake(20, 120, CGRectGetWidth(self.view.frame) - 40, 44.f)];
    _btn.layer.cornerRadius = 8.f;
    _btn.disableWhenLoad = NO;
    _btn.backgroundColor = [UIColor greenColor];
    [_btn setTitle:@"开始加载" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}


-(void)btnClicked:(LYSLoadingButton*)sender{
    [sender toggle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
