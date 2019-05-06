//
//  ContainerCell.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "ContainerCell.h"
#import "IntroduceController.h"
#import "ChatController.h"
#import "LIstViewController.h"
#import "MemberController.h"
#import "PLaybackController.h"

@interface ContainerCell ()<UIScrollViewDelegate>

@property (strong , nonatomic) IntroduceController *introduce;
@property (strong , nonatomic) ChatController *chatControl;
@property (strong , nonatomic) LIstViewController *listControl;
@property (strong , nonatomic) MemberController *memberControl;
@property (strong , nonatomic) PLaybackController *backControl;


@end
@implementation ContainerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.scrollView];
    
    }
    return self;
}


- (void)setVC:(UIViewController *)VC{
    _VC = VC;
    
    if (self.blockControl) {
         self.blockControl(VC);
    }
    
    _introduce = [[IntroduceController alloc] init];
    _introduce.VC = VC;
    _chatControl = [[ChatController alloc] init];
    _chatControl.VC = VC;
    _listControl = [[LIstViewController alloc] init];
    _listControl.VC = VC;
    _memberControl = [[MemberController alloc] init];
    _memberControl.VC = VC;
    _backControl = [[PLaybackController alloc] init];
    _backControl.VC = VC;
    
    
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    self.objCanScroll = NO;
}

// 通知外部内部滚动 外部保持不动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (!self.objCanScroll) {
        if (self.scrollView == scrollView) {
            
            if ([self.delegate respondsToSelector:@selector(containerViewDidScroll:)]) {
                [self.delegate containerViewDidScroll:scrollView];
            }
            
        }
        
    }
    
}


// 通知外部 内部滚动完毕 外部可以开始滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView == self.scrollView) {
        if ([self.delegate respondsToSelector:@selector(bottomScrollViewContentscroll:)]) {
            [self.delegate bottomScrollViewContentscroll:scrollView];
        }
    }
    
}

- (void)setObjCanScroll:(BOOL)objCanScroll{
    
    _objCanScroll = objCanScroll;
    self.introduce.isScroll = objCanScroll;
    self.chatControl.isScroll = objCanScroll;
    self.listControl.isScroll = objCanScroll;
    self.memberControl.isScroll = objCanScroll;
    self.backControl.isScroll = objCanScroll;
    
    if (!objCanScroll) {
        
    }
    
}

- (void)setItemArray:(NSArray *)itemArray{
    
    _itemArray = itemArray;
    
    self.scrollView.contentSize = CGSizeMake(ScreenW * self.itemArray.count, ScreenH - scrollHeaderHeight);
    __weak typeof(self) weakSelf = self;
    [self.itemArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isEqualToString:@"简介"]) {
            weakSelf.introduce.view.frame = CGRectMake(ScreenW * idx, 0, ScreenW, ScreenH-scrollHeaderHeight);
            [self.scrollView addSubview:weakSelf.introduce.view];
        }
        if ([obj isEqualToString:@"聊天"]) {
            weakSelf.chatControl.view.frame = CGRectMake(ScreenW * idx, 0, ScreenW, self.scrollView.frame.size.height);
            [self.scrollView addSubview:weakSelf.chatControl.view];
        }
        if ([obj isEqualToString:@"榜单"]) {
            weakSelf.listControl.view.frame = CGRectMake(ScreenW * idx, 0, ScreenW, self.scrollView.frame.size.height);
            [self.scrollView addSubview:weakSelf.listControl.view];
        }
        if ([obj isEqualToString:@"成员"]) {
            weakSelf.memberControl.view.frame = CGRectMake(ScreenW * idx, 0, ScreenW, self.scrollView.frame.size.height);            [self.scrollView addSubview:weakSelf.memberControl.view];
        }
        if ([obj isEqualToString:@"回放"]) {
            weakSelf.backControl.view.frame = CGRectMake(ScreenW * idx, 0, ScreenW, self.scrollView.frame.size.height);
            [self.scrollView addSubview:weakSelf.backControl.view];
        }
    }];
}

- (UIScrollView *)scrollView{
    
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, ScreenW, ScreenH - scrollHeaderHeight)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor cyanColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}



@end
