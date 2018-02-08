//
//  TransitionVC.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/8.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "TransitionVC.h"

@interface TransitionVC ()
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation TransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setup];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(20, 20, 40, 40);
    [btn1 setTitle:@"back" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)setup
{
    UIScrollView *scView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    scView.contentSize = CGSizeMake(width, 1000);
    [self.view addSubview:scView];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//    [self.imgView.layer addAnimation:transition forKey:nil];
    [scView addSubview:self.imgView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(120, 100, 80, 30);
    [btn1 setTitle:@"animation" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(transitionAction) forControlEvents:UIControlEventTouchUpInside];
    [scView addSubview:btn1];
    
    UILabel *tipsLB1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 130, 200, 100)];
    tipsLB1.adjustsFontSizeToFitWidth = YES;
    tipsLB1.numberOfLines = 0;
    tipsLB1.text = @"CATransition用于改变一个不能动画的属性(比如图片)，或者从层级关系中添加或者移除图层，属性动画将不起作用。过渡并不像属性动画那样平滑地在两个值之间做动画，而是影响到整个图层的变化。过渡动画首先展示之前的图层外观，然后通过一个交换过渡到新的外观。";
    [scView addSubview:tipsLB1];
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

NSInteger i = 1;
- (void)transitionAction
{
    UIImage *img = nil;
    if (i == 1) {
        img = [UIImage imageNamed:@"th"];
    } else if (i == 2) {
        img = [UIImage imageNamed:@"logo"];
    } else if (i == 3) {
        img = [UIImage imageNamed:@"img"];
    } else {
        i = 1;
        img = [UIImage imageNamed:@"th"];
    }
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 2.0;
    [self.imgView.layer addAnimation:transition forKey:nil];
    self.imgView.image = img;
    i ++;
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
