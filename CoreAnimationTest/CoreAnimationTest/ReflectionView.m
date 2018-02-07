//
//  ReflectionView.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/6.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "ReflectionView.h"

@implementation ReflectionView
//UIView有一个layerClass类方法，返回主layer所使用的类，UIView的子类，可以通过重载这个方法，来让UIView使用不同的CALayer来显示
+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.rfGap = 20.0;
        self.rfAlpha = 0.5;
        self.rfXRotate = 0.75 * M_PI_2;
        self.M34Value = - 1.0 / 500.0;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.rfGap = 20.0;
        self.rfAlpha = 0.5;
        self.rfXRotate = 0.75 * M_PI_2;
        self.M34Value = - 1.0 / 500.0;
    }
    return self;
}

- (void)layoutSubviews
{
    [self update];
}

- (void)update
{
    CAReplicatorLayer *layer = (CAReplicatorLayer *)[self layer];
    layer.instanceCount = 2;
    layer.preservesDepth = YES;
    layer.anchorPoint = CGPointMake(0.5, 1);//改变了锚点
    layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, self.bounds.size.height / 2.0, 0);//恢复位置
    //合成一个翻转的变形矩阵
    CATransform3D transform = CATransform3DIdentity;//初始矩阵，单位矩阵
    transform.m34 = self.M34Value;
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    transform = CATransform3DRotate(transform, self.rfXRotate, 1, 0, 0);
    transform = CATransform3DTranslate(transform, 0, -self.rfGap, 0);
    layer.instanceTransform = transform;
    
    layer.instanceAlphaOffset = -self.rfAlpha;
}

@end
