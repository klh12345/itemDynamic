//
//  UILabel+label.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "UILabel+label.h"

@implementation UILabel (label)


- (UILabel *)labelWithfont:(CGFloat)font titleColor:(UIColor *)color aligment:(NSTextAlignment)aligment{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = FONT(font);
    label.textColor = color;
    label.textAlignment = aligment;
    label.numberOfLines = 1;
    return label;
    
}

@end
