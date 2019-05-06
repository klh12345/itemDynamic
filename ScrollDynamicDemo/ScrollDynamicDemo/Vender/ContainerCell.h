//
//  ContainerCell.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^blockControl)(UIViewController *vc);


@protocol ScrollViewDidscrollDelegate <NSObject>

// 把内部正在滚东的事件传递到外部 使外部不滚动
- (void)containerViewDidScroll:(UIScrollView *)scroll;

// 底部的ScrollView滚动事件传递到主控制器配合button 显示
-(void)bottomScrollViewContentscroll:(UIScrollView *)scroll;

@end

@interface ContainerCell : UITableViewCell

@property (strong , nonatomic) UIScrollView *scrollView;
@property (strong , nonatomic) NSArray *itemArray;


@property (copy , nonatomic) void (^blockControl)(UIViewController *vc);

// 内部的控制器左右滚动时 通知外部不滚动
@property (assign , nonatomic) BOOL isContetScroll;
@property (assign , nonatomic) BOOL objCanScroll;

@property (strong , nonatomic) UIViewController *VC;

@property (assign , nonatomic) id<ScrollViewDidscrollDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
