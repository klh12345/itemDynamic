//
//  AdvertiseIconItems.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/11.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "AdvertiseIconItems.h"

@implementation AdvertiseIconItems

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.icons = [UIImageView new];
        self.icons.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.icons];
        [self.icons mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(self.contentView);
            make.width.mas_equalTo(self.contentView);
        }];
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName{
    
    _imageName = imageName;

    self.icons.image = [UIImage imageNamed:@"dt_di_slices"];
    
}



@end
