//
//  PlayerView.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/8.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(250, 250, 250);
        
        UILabel *labels = [[UILabel alloc] init];
        labels.text = @"美播云直播管理页面....";
        labels.font = FONT(14);
        labels.textColor = RGB(51, 51, 51);
        [self addSubview:labels];
        
        [labels mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self).offset(15);
        }];
        
    }
    
    return self;
}


@end
