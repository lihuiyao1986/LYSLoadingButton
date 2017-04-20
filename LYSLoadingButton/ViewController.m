//
//  ViewController.m
//  LYSLoadingButton
//
//  Created by jk on 2017/4/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "ViewController.h"
#import "LYSLoadingButton.h"
#import "LYSLoadButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    LYSLoadingButton *_btn = [[LYSLoadingButton alloc]initWithFrame:CGRectMake(20, 120, CGRectGetWidth(self.view.frame) - 40, 44.f)];
    _btn.layer.cornerRadius = 8.f;
    _btn.disableWhenLoad = NO;
    _btn.tag = 100;
    _btn.backgroundColor = [UIColor greenColor];
    [_btn setTitle:@"开始加载1" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    LYSLoadButton *btn1 = [LYSLoadButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(20, CGRectGetMaxY(_btn.frame) + 20, CGRectGetWidth(self.view.frame) - 40, 44.f);
    btn1.tag = 1000;
    btn1.normalImageBgColor = [self colorToImage:[UIColor redColor]];
    btn1.hightImageBgColor = [self colorToImage:[UIColor redColor]];
    btn1.loadingBgImage = [self colorToImage:[UIColor greenColor]];
    btn1.loadingTextColor = [UIColor grayColor];
    [btn1 setTitle:@"开始加载2" forState:UIControlStateNormal];
    [btn1 setTitle:@"开始加载2" forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

#pragma mark - 颜色转图片
-(UIImage*)colorToImage:(UIColor*)color{
    CGRect newRect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(newRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, newRect);
    UIImage* theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(void)btnClicked:(UIButton*)sender{
    NSUInteger tag = sender.tag;
    if (tag == 100) {
        [((LYSLoadingButton*)sender) toggle];
    }else{
        [((LYSLoadButton*)sender) startLoading:@"正在提交..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [((LYSLoadButton*)sender) stopLoading];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
