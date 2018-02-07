//
//  AnimationView.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/7.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
//    [self setup];
}

- (void)setup
{
    //layer首先检测是否有delegate，如果没有代理，或者并没有实现actionforLayer:forkey方法，则会在self.layer.actions内找属性对应的键值对，并执行动画，如果有值的话
    //如果像self。layer一样，默认代理就是self，那么下面的self.layer.actions没有意义
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    self.layer.actions = @{@"backgroundColor":transition};
}


//覆盖CALayerDelegate的代理方法，返回自定义的CAAction（动画）
//即使没有返回CAAction，self.layer最后默认会调用-defaultActionForKey:方法，实现隐式动画的效果
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    if (layer == self.layer) {
        if ([event isEqualToString:@"backgroundColor"]) {
            CATransition *transition = [CATransition animation];
            transition.type = kCATransitionReveal;
            transition.subtype = kCATransitionFromBottom;
            return transition;
        }
    }
    return nil;
}
@end
