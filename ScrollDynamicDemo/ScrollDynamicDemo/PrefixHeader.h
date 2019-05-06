//
//  PrefixHeader.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/8.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#import <Masonry.h>
#import <SDCycleScrollView.h>
#import <UIImageView+WebCache.h>
#import "UILabel+label.h"
#import "NSString+str.h"

#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define LARGESCREEN ScreenW>375
#define SMALLSCREEN ScreenH<375
#define FONT(X) [UIFont systemFontOfSize:LARGESCREEN?X+1:(SMALLSCREEN?X-1:X)]
#define Font(x) (x)*(ScreenH)/667
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define W(w) ((w)/375.f * ScreenW)
#define H(h) ((h)/667.f * ScreenH)

#define scrollHeaderHeight 38

//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

#endif /* PrefixHeader_h */
