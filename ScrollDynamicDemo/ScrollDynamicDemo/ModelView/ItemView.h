//
//  ItemView.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^buttonAction)(UIButton *button);

@interface ItemView : UIView

@property (strong , nonatomic) UIView *line;
@property (copy , nonatomic) void (^buttonAction)(UIButton *button);
@property (strong , nonatomic) NSArray *items;
@property (strong , nonatomic) NSMutableArray *totalButton;

@property (strong , nonatomic) UIButton *currentButton;


@end

NS_ASSUME_NONNULL_END
