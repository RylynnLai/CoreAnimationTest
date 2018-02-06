//
//  UIView+CornerRadius.m
//  CoreAnimationTest
//
//  Created by LLZ on 2018/2/6.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "UIView+CornerRadius.h"
#import <objc/runtime.h>

static const NSString *rlcornerRadius;

@implementation UIView (CornerRadius)
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius <= 0) {
        NSNumber *c = [NSNumber numberWithFloat:0.0];
        objc_setAssociatedObject(self, &rlcornerRadius, c, OBJC_ASSOCIATION_ASSIGN);
        
        self.layer.mask = nil;
    } else {
        NSNumber *c = [NSNumber numberWithFloat:cornerRadius];
        objc_setAssociatedObject(self, &rlcornerRadius, c, OBJC_ASSOCIATION_ASSIGN);
        
        UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        CAShapeLayer *layer2 = [CAShapeLayer new];
        layer2.path = path2.CGPath;
        
        self.layer.mask = layer2;
    }
}

- (CGFloat)cornerRadius
{
    return [objc_getAssociatedObject(self, &rlcornerRadius) doubleValue];
}
@end
