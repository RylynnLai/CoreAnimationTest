//
//  CALayerTestVC.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/5.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "CALayerTestVC.h"

@interface CALayerTestVC ()

@end

@implementation CALayerTestVC

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
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    v1.backgroundColor = [UIColor blueColor];
    v1.layer.cornerRadius = 20;
    v1.layer.masksToBounds = YES;
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(-30, -30, 80, 80)];
    v2.backgroundColor = [UIColor redColor];
    [v1 addSubview:v2];
    [scView addSubview:v1];
    
    UILabel *tipsLB1 = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 200, 40)];
    tipsLB1.adjustsFontSizeToFitWidth = YES;
    tipsLB1.numberOfLines = 0;
    tipsLB1.text = @"同时设置layer的cornerRadius和masksToBounds会触发离屏渲染";
    [scView addSubview:tipsLB1];
    
    /////////////////////////////////////////////////////////////////////////////////
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 100, 100)];
    v3.backgroundColor = [UIColor blueColor];
    v3.layer.borderWidth = 10;
    v3.layer.borderColor = [UIColor orangeColor].CGColor;
    //即使设置masksToBounds也不会触发离屏渲染
    v3.layer.masksToBounds = YES;

    [scView addSubview:v3];

    UILabel *tipsLB2 = [[UILabel alloc] initWithFrame:CGRectMake(130, 220, 200, 60)];
    tipsLB2.adjustsFontSizeToFitWidth = YES;
    tipsLB2.numberOfLines = 0;
    tipsLB2.text = @"设置layer的边框borderWidth会占用frame的大小，即使设置masksToBounds也不会触发离屏渲染";
    [scView addSubview:tipsLB2];
    
    /////////////////////////////////////////////////////////////////////////////////
    UIView *v4 = [[UIView alloc] initWithFrame:CGRectMake(20, 340, 100, 100)];
    v4.backgroundColor = [UIColor clearColor];
    v4.layer.shadowOpacity = 0.5;
    
    UIView *v5 = [[UIView alloc] initWithFrame:v4.bounds];
    v5.backgroundColor = [UIColor blueColor];
    v5.layer.cornerRadius = 10;
    v5.layer.masksToBounds = YES;
    
    UIView *v6 = [[UIView alloc] initWithFrame:CGRectMake(-30, -30, 80, 80)];
    v6.backgroundColor = [UIColor yellowColor];
    
    [scView addSubview:v4];
    [v4 addSubview:v5];
    [v5 addSubview:v6];
    
    UILabel *tipsLB3 = [[UILabel alloc] initWithFrame:CGRectMake(130, 340, 200, 60)];
    tipsLB3.adjustsFontSizeToFitWidth = YES;
    tipsLB3.numberOfLines = 0;
    tipsLB3.text = @"阴影会触发离屏渲染，masksToBounds会剪切掉阴影效果，需要同时圆角和阴影可以通过叠加一层阴影view实现";
    [scView addSubview:tipsLB3];
    
    /////////////////////////////////////////////////////////////////////////////////
    UIView *v7 = [[UIView alloc] initWithFrame:CGRectMake(20, 460, 100, 100)];
    v7.backgroundColor = [UIColor greenColor];
    v7.alpha = 0.5;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(15, 30, 70, 40);
    [btn setTitle:@"组透明" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(opaqueAction) forControlEvents:UIControlEventTouchUpInside];
//    btn.alpha = 0.5;
    [v7 addSubview:btn];
    [scView addSubview:v7];
    
    UILabel *tipsLB4 = [[UILabel alloc] initWithFrame:CGRectMake(130, 460, 200, 60)];
    tipsLB4.adjustsFontSizeToFitWidth = YES;
    tipsLB4.numberOfLines = 0;
    tipsLB4.text = @"对于嵌套有子视图的view设置透明度会触发离屏渲染，光栅化？？？？";
    [scView addSubview:tipsLB4];
    
    /////////////////////////////////////////////////////////////////////////////////
    UIImageView *v8 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 580, 100, 100)];
    v8.image = [UIImage imageNamed:@"img"];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = v8.bounds;
    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"logo"].CGImage);
    
    v8.layer.mask = maskLayer;
    [scView addSubview:v8];
    
    UILabel *tipsLB5 = [[UILabel alloc] initWithFrame:CGRectMake(130, 580, 200, 100)];
    tipsLB5.adjustsFontSizeToFitWidth = YES;
    tipsLB5.numberOfLines = 0;
    tipsLB5.text = @"会触发离屏渲染，可以通过layer制作图层蒙版，实现裁剪的效果。实际上，任何图层都可以作为mask制成蒙版，意味着可以通过代码制成（path）或动画实时制成";
    [scView addSubview:tipsLB5];
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)opaqueAction
{
    
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
