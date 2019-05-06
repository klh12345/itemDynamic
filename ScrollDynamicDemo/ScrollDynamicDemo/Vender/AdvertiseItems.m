//
//  AdvertiseItems.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "AdvertiseItems.h"

#define speed  0.3

@interface AdvertiseItems ()<CAAnimationDelegate>

@end
@implementation AdvertiseItems

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        
//        self.icons = [[UIImageView alloc] init];
        self.labels = [[UILabel alloc] labelWithfont:11 titleColor:RGB(51, 51, 51) aligment:NSTextAlignmentLeft];
//        self.scrollLabel = [[UILabel alloc] labelWithfont:11 titleColor:RGB(51, 51, 51) aligment:NSTextAlignmentLeft];
        
//        [self.contentView addSubview:self.icons];
//        [self.contentView addSubview:self.scrollLabel];
        [self.contentView addSubview:self.labels];
        
        // 相对布局 谁存在谁显示
//        [self.icons mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.mas_equalTo(self.contentView);
//            make.height.mas_equalTo(self.contentView);
//        }];
//        [self.scrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(self.contentView);
//            make.left.mas_equalTo(self.icons.mas_left);
//        }];
        [self.labels mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView);
            make.centerY.mas_equalTo(self.contentView);
            make.width.mas_equalTo(self.contentView);
        }];
        
    }
    return self;
}

- (void)setItems:(NSString *)items{
    _items = items;
    
    self.labels.attributedText = [NSString setLabelIndent:12.0f text:items];
    
}


@end
