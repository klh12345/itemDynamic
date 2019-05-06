//
//  NSString+str.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (str)


+ (void)setStatusBarBackgroundColor:(UIColor *)color;

+ (BOOL)islargeScreenWithText:(NSString *)text font:(int)font;

+ (NSAttributedString *)setLabelIndent:(CGFloat)indent text:(NSString *)text;


@end

NS_ASSUME_NONNULL_END
