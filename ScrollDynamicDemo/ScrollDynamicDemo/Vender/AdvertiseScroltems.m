//
//  AdvertiseScroltems.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/11.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "AdvertiseScroltems.h"

#define speed  0.3

@interface AdvertiseScroltems ()<CAAnimationDelegate>

@end

@implementation AdvertiseScroltems


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor= [UIColor whiteColor];
        
        self.scrollLabel = [[UILabel alloc] labelWithfont:11 titleColor:RGB(51, 51, 51) aligment:NSTextAlignmentLeft];
        [self.contentView addSubview:self.scrollLabel];
        [self.scrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(self.contentView);
            make.width.mas_equalTo(self.contentView);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutSubviews) name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
        
        
    }
    return self;
}

- (void)setLabelName:(NSString *)labelName{
    
    _labelName = labelName;
    
    [self addAnimation];
    self.scrollLabel.text = @"这里是杭州迈可行通信股份有限公司这里是杭州迈可行通信股份有限公司这里是杭州迈可行通信股份有限公司";
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.animatonStop) {
        [self addAnimation];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    if (newWindow)
    {
        [self addAnimation];
    }
}

- (void)addAnimation{

//    if (self.frame.size.width > self.scrollLabel.frame.size.width) {
//
//        return;
//    }
    
    [self.scrollLabel.layer removeAllAnimations];
    CGFloat space = self.scrollLabel.frame.size.width - self.frame.size.width;
    
//    CGFloat space = self.frame.size.width;
    
    CAKeyframeAnimation* keyAnimy = [CAKeyframeAnimation animation];
    keyAnimy.keyPath = @"transform.translation.x";
    keyAnimy.values = @[@(-space), @(-space), @(0)];
    keyAnimy.repeatCount = NSIntegerMax;
    // 原路返回
    keyAnimy.autoreverses = NO;
    // 动画完成后不移除
    keyAnimy.removedOnCompletion = NO;
    keyAnimy.fillMode = kCAFillModeForwards;
    keyAnimy.duration = speed * self.scrollLabel.text.length;
    keyAnimy.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithControlPoints:0 :0 :0.5 :0.5]];
    __weak typeof(self) weakSelf = self;
    keyAnimy.delegate = weakSelf;
    
    [self.scrollLabel.layer addAnimation:keyAnimy forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    self.animatonStop = !flag;
    
}



@end
