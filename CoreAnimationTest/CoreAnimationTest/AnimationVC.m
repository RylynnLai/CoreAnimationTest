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
@property (nonatomic, strong) CALayer *layer3;
@property (nonatomic, strong) CALayer *layer4;
@property (nonatomic, strong) AnimationView *view1;

@property (nonatomic, strong) UIView *view2;

@property (nonatomic, strong) UIScrollView *scView;
@end

@implementation AnimationVC

//CAAnimation是一个抽象类，一般需要用到子类来实现动画。CAAnimation的子类包括CAPropertyAnimation，CAAnimationGroup和CATransition
//而CAPropertyAnimation又有子类CABasicAnimation和CAKeyframeAnimation

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
//    self.scView.userInteractionEnabled = NO;
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
    
    /////////////////////////////////////////////////////////////////////////////////
    self.layer3 = [CALayer layer];
    self.layer3.frame = CGRectMake(20, 480, 100, 100);
    self.layer3.backgroundColor = [UIColor magentaColor].CGColor;
    [self.scView.layer addSublayer:self.layer3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn4.frame = CGRectMake(120, 480, 80, 30);
    [btn4 setTitle:@"BasicAnimationView" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(basicAnimationViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn4];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.layer4 = [CALayer layer];
    self.layer4.frame = CGRectMake(20, 600, 100, 100);
    self.layer4.backgroundColor = [UIColor grayColor].CGColor;
    [self.scView.layer addSublayer:self.layer4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn5.frame = CGRectMake(120, 600, 80, 30);
    [btn5 setTitle:@"KeyframeAnimation" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(keyframeAnimationViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn5];
    
    /////////////////////////////////////////////////////////////////////////////////
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(20, 720, 100, 100)];
    self.view2.backgroundColor = [UIColor grayColor];
    [self.scView addSubview:self.view2];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn6.frame = CGRectMake(120, 720, 80, 30);
    [btn6 setTitle:@"AnimationGroup" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(animationGroupAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scView addSubview:btn6];
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

- (void)basicAnimationViewAction
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
    animation.removedOnCompletion = NO;
    animation.toValue = @300;
    //    animation.autoreverses = YES;//是否动画结束后，已相同的动画回到开始的值
//    animation.beginTime = CACurrentMediaTime() + 1;
    
    //非active时间段的行为. 比如动画开始之前,动画结束之后，就是影响呈现layer的行为，对原layer都没有影响
    //kCAFillModeForwards是在动画开始之后layer迅速进入指定位置开始执行动画并在removedOnCompletion = NO的前提下会停在动画结束的最后位置，而kCAFillModeBackwards则是在动画开始之前迅速进入指定状态并在动画开始后执行动画，动画结束后迅速返回到layer的本身位置
    //如果kCAFillModeForwards和kCAFillModeBackwards区分后那kCAFillModeBoth就很好理解了如果removedOnCompletion = NO那layer会在动画开始之前就会迅速进入动画的初始位置并在执行完动画后停在动画结束的位置，如果removedOnCompletion = YES那layer会在动画开始之前就会迅速进入动画的初始位置并在执行完动画后迅速返回到layer的本身位置
    animation.fillMode = kCAFillModeForwards;
//    animation.repeatCount = 3;//动画重复次数
//    animation.repeatDuration = 1.0;
    animation.duration = 2.0;
    //    animation.delegate = self;
    
    [self.layer3 addAnimation:animation forKey:nil];
}

- (void)keyframeAnimationViewAction
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    //根据animation.path来指定动画路线
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(100, 150) controlPoint1:CGPointMake(200, 300) controlPoint2:CGPointMake(300, 0)];
    animation.path = path.CGPath;
    
    //可以通过animation.values来指定关键帧
//    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(20, 100)],
//                         [NSValue valueWithCGPoint:CGPointMake(120, 200)],
//                         [NSValue valueWithCGPoint:CGPointMake(220, 100)]];
    animation.duration = 2.0;
//    animation.beginTime = CACurrentMediaTime() + 1;
    [self.layer4 addAnimation:animation forKey:nil];
}

- (void)animationGroupAction
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    //默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards .
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = YES;
    animation.toValue = @200;
    animation.duration = 1.0;
    animation.repeatCount = MAXFLOAT;
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
//    animation1.removedOnCompletion = NO;
//    animation1.fillMode = kCAFillModeForwards;
    animation1.values = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor grayColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.animations = @[animation, animation1];
    [self.view2.layer addAnimation:group forKey:nil];
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

#pragma mark - CAAnimationDelegate
//所有动画都不会影响layer的真实属性
//如果希望动画结束后，view的属性更新，需要在代理方法里更新属性。如果是非主layer的属性更新，需要关闭隐式动画
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
////    self.colorLayer.backgroundColor = (__bridge CGColorRef _Nullable)([(CABasicAnimation *)anim toValue]);
//    [CATransaction commit];
//}

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
