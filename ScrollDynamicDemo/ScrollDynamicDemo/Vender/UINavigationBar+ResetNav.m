//
//  UINavigationBar+ResetNav.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/11.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "UINavigationBar+ResetNav.h"
#import <objc/runtime.h>
@implementation UINavigationBar (ResetNav)

static char overly;

- (UIView *)overlay{
    
    return objc_getAssociatedObject(self, &overly);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overly, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)resetBackGroundColor:(UIColor *)colors{
    
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -[UIApplication sharedApplication].statusBarFrame.size.height, ScreenW, ScreenH + [UIApplication sharedApplication].statusBarFrame.size.height)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self insertSubview:self.overlay atIndex:0];
    }
    
    self.overlay.backgroundColor = colors;
    
}

- (void)reset{
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
    
}






@end
