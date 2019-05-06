//
//  NSString+str.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "NSString+str.h"

@implementation NSString (str)


+ (BOOL)islargeScreenWithText:(NSString *)text font:(int)font{
    

    CGSize size = [self getAttributeSizeWithText:text fontSize:font];
    
    if (size.width > ScreenW) {
        return YES;
    }else{
     
        return NO;
    }
    
}
+ (CGSize)getAttributeSizeWithText:(NSString *)text fontSize:(int)fontSize
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    
    NSAttributedString *attributeSting = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    size = [attributeSting size];
    
    return size;
}


+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


+ (NSAttributedString *)setLabelIndent:(CGFloat)indent text:(NSString *)text {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = indent * 1;
    NSDictionary *attributeDic = @{NSParagraphStyleAttributeName : paragraphStyle};
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:text attributes:attributeDic];
    
    return attrText;
}





@end
