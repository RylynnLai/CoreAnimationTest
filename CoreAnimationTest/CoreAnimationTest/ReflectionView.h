//
//  ReflectionView.h
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/6.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReflectionView : UIView

/**
 实物离倒影的距离，默认值20
 */
@property (nonatomic, assign) IBInspectable CGFloat rfGap;

/**
 倒影透明度，默认值0.5
 */
@property (nonatomic, assign) IBInspectable CGFloat rfAlpha;

/**
 倒影的x旋转角度默认值 0.75 * M_PI_2
 */
@property (nonatomic, assign) IBInspectable CGFloat rfXRotate;

/**
 远小近大的因子，默认值 -1.0 / 500.0
 */
@property (nonatomic, assign) IBInspectable CGFloat M34Value;

//@property (nonatomic, assign) IBInspectable BOOL dynamic;

- (void)update;

@end
