//
//  ScrollController.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/8.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollController : UIViewController

@property (assign , nonatomic) BOOL kind;
@property (strong , nonatomic) NSArray *itemsarray;

@end

NS_ASSUME_NONNULL_END
