//
//  CALayerTestPlusVC.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/5.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "CALayerTestPlusVC.h"
#import "UIView+CornerRadius.h"

@interface CALayerTestPlusVC ()

@end

@implementation CALayerTestPlusVC

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
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(10, 10)];
    [path1 addLineToPoint:CGPointMake(20, 90)];
    [path1 addLineToPoint:CGPointMake(40, 50)];
    [path1 addLineToPoint:CGPointMake(-20, 90)];
    [path1 addLineToPoint:CGPointMake(120, 20)];//path没有封闭，但是填充会自动封闭
    
    CAShapeLayer *layer1 = [CAShapeLayer new];
    layer1.backgroundColor = [UIColor blueColor].CGColor;
    layer1.frame = CGRectMake(20, 100, 100, 100);
    layer1.lineWidth = 5;
    layer1.strokeColor = [UIColor redColor].CGColor;//path路径颜色
    layer1.fillColor = [UIColor greenColor].CGColor;//path填充颜色
    layer1.lineJoin = kCALineJoinRound;//path连接处样式
    layer1.lineCap = kCALineCapButt;//path末端的样式
    layer1.path = path1.CGPath;
    [scView.layer addSublayer:layer1];
    
    UILabel *tipsLB1 = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 200, 100)];
    tipsLB1.adjustsFontSizeToFitWidth = YES;
    tipsLB1.numberOfLines = 0;
    tipsLB1.text = @"CAShapeLayer用来绘制所有通过CGPath来表示的形状，相比父类CALayer，CAShapeLayer可以绘画fram以外的的区域，并且仅仅包括path内容，不包括frame大小的背景矩形";
    [scView addSubview:tipsLB1];
    
    /////////////////////////////////////////////////////////////////////////////////
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 100, 100)];
    v1.backgroundColor = [UIColor blueColor];
//    v1.cornerRadius = 20;
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:v1.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *layer2 = [CAShapeLayer new];
    layer2.frame = v1.bounds;
    layer2.path = path2.CGPath;

    v1.layer.mask = layer2;
    [scView addSubview:v1];
    
    UILabel *tipsLB2 = [[UILabel alloc] initWithFrame:CGRectMake(130, 220, 200, 40)];
    tipsLB2.adjustsFontSizeToFitWidth = YES;
    tipsLB2.numberOfLines = 0;
    tipsLB2.text = @"使用CAShapeLayer制成的圆角矩形mask，可以避免性能问题";
    [scView addSubview:tipsLB2];
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
