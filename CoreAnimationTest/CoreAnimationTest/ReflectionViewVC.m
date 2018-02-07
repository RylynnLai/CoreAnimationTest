//
//  ReflectionViewVC.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/6.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "ReflectionViewVC.h"

@interface ReflectionViewVC ()

@end

@implementation ReflectionViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(20, 20, 40, 40);
    [btn1 setTitle:@"back" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
