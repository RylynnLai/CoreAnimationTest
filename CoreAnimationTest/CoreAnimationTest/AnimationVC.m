//
//  AnimationVC.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/7.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "AnimationVC.h"
#import "AnimationView.h"

@interface AnimationVC ()
@property (nonatomic, strong) CALayer *layer1;
@property (nonatomic, strong) CALayer *layer2;
@property (nonatomic, strong) AnimationView *view1;

@property (nonatomic, strong) UIScrollView *scView;
@end

@implementation AnimationVC

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
    self.scView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scView.userInteractionEnabled = NO;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.scView.contentSize = CGSizeMake(width, 1000);
    [self.view addSubview:self.scView];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.layer1 = [CALayer layer];
    self.layer1.backgroundColor = [UIColor blueColor].CGColor;
    self.layer1.frame = CGRectMake(20, 100, 100, 100);
    [self.scView.layer addSublayer:self.layer1];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(120, 100, 80, 30);
    [btn1 setTitle:@"animation" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(animationAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn1];
    
    UILabel *tipsLB1 = [[UILabel alloc] initWithFrame:CGRectMake(130, 130, 200, 100)];
    tipsLB1.adjustsFontSizeToFitWidth = YES;
    tipsLB1.numberOfLines = 0;
    tipsLB1.text = @"所有的非UIView关联的layer，都默认支持隐式动画";
    [self.scView addSubview:tipsLB1];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.view1 = [[AnimationView alloc] initWithFrame:CGRectMake(20, 220, 100, 100)];
    self.view1.backgroundColor = [UIColor redColor];
    [self.scView addSubview:self.view1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(120, 220, 80, 30);
    [btn2 setTitle:@"AnimationView" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(animationViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn2];
    
    UILabel *tipsLB2 = [[UILabel alloc] initWithFrame:CGRectMake(130, 250, 200, 100)];
    tipsLB2.adjustsFontSizeToFitWidth = YES;
    tipsLB2.numberOfLines = 0;
    tipsLB2.text = @"layer之所以能做隐式动画,是因为对应的属性有对应的action，而UIview对应的layer对应的delegate是它自己，而它的actionforlayer:forkey方法每次都是返回nil，所以它没有对应的action";
    [self.scView addSubview:tipsLB2];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.layer2 = [CALayer layer];
    self.layer2.frame = CGRectMake(20, 360, 100, 100);
    self.layer2.backgroundColor = [UIColor redColor].CGColor;
    [self.scView.layer addSublayer:self.layer2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(120, 360, 80, 30);
    [btn3 setTitle:@"presentationLayer" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(presentationLayerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn3];
    
    UILabel *tipsLB3 = [[UILabel alloc] initWithFrame:CGRectMake(130, 390, 200, 100)];
    tipsLB3.adjustsFontSizeToFitWidth = YES;
    tipsLB3.numberOfLines = 0;
    tipsLB3.text = @"layer触发隐形动画后，呈现在屏幕上的并不是layer本身，而是presentationLayer，通常我们不关心动画过程中的layer，如果需要获得动画过程中layer的位置，或者是需要在动画过程中响应用户交互，就要用到presentationLayer";
    [self.scView addSubview:tipsLB2];
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)animationAction
{
    [CATransaction begin];
//    [CATransaction setDisableActions:YES];//可以关闭动画效果
    [CATransaction setAnimationDuration:2.0];//动画时间
    [CATransaction setCompletionBlock:^{
        NSLog(@"动画结束");
    }];//类比UIView的动画Completion block
    self.layer1.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0].CGColor;
    [CATransaction commit];
}

- (void)animationViewAction
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];//动画时间
    self.view1.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    [CATransaction commit];
}

- (void)presentationLayerAction
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];//动画时间
    CGFloat x = arc4random_uniform(20) + 20;
    CGFloat y = arc4random_uniform(20) + 360;
    self.layer2.frame = CGRectMake(x, y, 100, 100);
    [CATransaction commit];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self.scView];
    if ([self.layer2.presentationLayer hitTest:p]) {
        self.layer2.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0].CGColor;
    } else {
        self.layer2.position = p;
    }
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
