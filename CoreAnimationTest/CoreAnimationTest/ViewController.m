//
//  ViewController.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/5.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "ViewController.h"
#import "CALayerTestVC.h"
#import "CALayerTestPlusVC.h"
#import "AnimationVC.h"
#import "TransitionVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(100, 100, 200, 100);
    [btn1 setTitle:@"CALayerTest" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 200, 200, 100);
    [btn2 setTitle:@"CALayerTestPlusVC" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(100, 300, 200, 100);
    [btn3 setTitle:@"AnimationVC" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn4.frame = CGRectMake(100, 400, 200, 100);
    [btn4 setTitle:@"TransitionVC" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
}

- (void)btn1Action
{
    CALayerTestVC *vc = [CALayerTestVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)btn2Action
{
    CALayerTestPlusVC *vc = [CALayerTestPlusVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)btn3Action
{
    AnimationVC *vc = [AnimationVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)btn4Action
{
    TransitionVC *vc = [TransitionVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
