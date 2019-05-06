//
//  ScrollController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/8.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "ScrollController.h"
#import "PlayerView.h"
#import "CenterView.h"
#import "ItemView.h"


#import "GestureTableView.h"
#import "ContainerCell.h"
#import "AdvertiseCell.h"
#import "UINavigationBar+ResetNav.h"


@interface ScrollController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,ScrollViewDidscrollDelegate>
@property (strong , nonatomic) UIView *buttonView;
@property (strong , nonatomic) UIScrollView *scrollView;
@property (assign , nonatomic) CGFloat bottomY;

@property (assign , nonatomic) BOOL canScroll;//
@property (strong , nonatomic) GestureTableView *gestertable;
@property (strong , nonatomic) ContainerCell *containCell;
@property (strong , nonatomic) ItemView *itemView;


@end
static NSString *const ContainerCellID = @"ContainerCell";
static NSString *const AdvertiseCellid = @"AdvertiseCell";
@implementation ScrollController

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [NSString setStatusBarBackgroundColor:[UIColor clearColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.gestertable];
    self.gestertable.backgroundColor = [UIColor whiteColor];
    
    self.canScroll = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStatus) name:@"leaveTop" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeItems:) name:@"changeItems" object:nil];
    

}


- (void)changeStatus{
//    self.canScroll = YES;
    self.containCell.isContetScroll = NO;
    
}


- (void)changeItems:(NSNotification *)notify{
    
    if (self.itemView) {
        [self.itemView removeFromSuperview];
        self.itemView = nil;
    }
    
    
    self.itemsarray = @[@"简介",@"聊天",@"榜单",@"回放"];
    [self.gestertable reloadData];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
         return 1;
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        AdvertiseCell *advertise = [tableView dequeueReusableCellWithIdentifier:AdvertiseCellid];
        if (advertise == nil) {
            advertise = [[AdvertiseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AdvertiseCellid];
        }
        advertise.backgroundColor = RGB(100, 100, 100);
        
        return advertise;
    }
    ContainerCell *cell = [tableView dequeueReusableCellWithIdentifier:ContainerCellID];
    if (cell == nil) {
        cell = [[ContainerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ContainerCellID];
    }
    self.containCell = cell;
    self.containCell.delegate = self;
    self.containCell.VC = self;
    [self.containCell setItemArray:self.itemsarray];
    
    
    self.containCell.blockControl = ^(UIViewController * _Nonnull vc) {
        
    };
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 25;
    }else{
        return ScreenH - scrollHeaderHeight;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.001f;
    }else{
         return scrollHeaderHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
         return self.itemView;
    }else{
        return nil;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
}

// 内部滚动 外部停止滚动
- (void)containerViewDidScroll:(UIScrollView *)scroll{
    
    self.gestertable.scrollEnabled = NO;
}

// 内部滚动完毕 外部可以滚动
- (void)bottomScrollViewContentscroll:(UIScrollView *)scroll{
    
    CGFloat pointX = scroll.contentOffset.x;
    
    NSInteger buttonX = pointX/ScreenW;
    UIButton *momentButton = self.itemView.totalButton[buttonX];
    self.itemView.currentButton.titleLabel.font = FONT(13);
    self.itemView.currentButton.selected = NO;
    self.itemView.currentButton = momentButton;
    
    self.itemView.currentButton.selected = YES;
    self.itemView.currentButton.titleLabel.font = FONT(14);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.itemView.line.frame = CGRectMake(self.itemView.currentButton.frame.origin.x, self.itemView.currentButton.frame.size.height + 2, self.itemView.currentButton.frame.size.width, 1);
    }];
    
    self.gestertable.scrollEnabled = YES;
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
    
        self.navigationController.navigationBar.hidden = offsetY > 64 ? NO: offsetY< 64 ?YES:NO;
        NSString *str = [NSString stringWithFormat:@"%.2f",offsetY/200];
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:offsetY >150 ? 1 : offsetY < 30 ? 0:[str floatValue]];
    }
    else{
        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    }
    
    if (scrollView == self.gestertable) {
        
        CGFloat bottomContent = [self.gestertable rectForSection:1].origin.y - ([UIApplication sharedApplication].statusBarFrame.size.height + 44.0f);
        bottomContent = floor(bottomContent);
        if (scrollView.contentOffset.y > bottomContent) {
            scrollView.contentOffset = CGPointMake(0, bottomContent);
            // 如果是整体的滚动 停止滚动 设置内部可以滚动
            if (self.canScroll) {
                // 如果子视图为tableView 可把此开关打开 再通知内部的移动改变外部的滑动状态
//                self.canScroll = NO;
                self.containCell.isContetScroll = YES;
            }
        }else{
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, bottomContent);
            }
            
        }
        
    }
    
}

- (ItemView *)itemView{
    
    if (!_itemView) {
        _itemView = [[ItemView alloc] init];
         __weak typeof(self) weakSelf = self;
        _itemView.items = self.itemsarray;
        _itemView.buttonAction = ^(UIButton * _Nonnull button) {
            
            weakSelf.itemView.currentButton.selected = NO;
            weakSelf.itemView.currentButton.titleLabel.font= FONT(14);
            
            weakSelf.itemView.currentButton = button;
            weakSelf.itemView.currentButton.selected = YES;
            weakSelf.itemView.currentButton.titleLabel.font = FONT(14);
            
            // 内部视图可以滚动
            weakSelf.containCell.objCanScroll = YES;
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.itemView.line.frame = CGRectMake(button.frame.origin.x, button.frame.size.height + 2, button.frame.size.width, 1);
            }];
            
            // 1. 取出当前按钮 在数组中所处的位置 (此时的显示顺序是无序的 随机排序 如需有序 单独处理)
            [weakSelf.itemsarray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isEqualToString:@"简介"] && [button.currentTitle isEqualToString:@"简介"]) {
                    [weakSelf.containCell.scrollView setContentOffset:CGPointMake(ScreenW *idx, 0) animated:YES];
                }else if ([obj isEqualToString:@"聊天"] && [button.currentTitle isEqualToString:@"聊天"]){
                    [weakSelf.containCell.scrollView setContentOffset:CGPointMake(ScreenW *idx, 0) animated:YES];
                }else if ([obj isEqualToString:@"榜单"] && [button.currentTitle isEqualToString:@"榜单"]){
                    [weakSelf.containCell.scrollView setContentOffset:CGPointMake(ScreenW *idx, 0) animated:YES];
                }
                else if ([obj isEqualToString:@"成员"] && [button.currentTitle isEqualToString:@"成员"]){
                    [weakSelf.containCell.scrollView setContentOffset:CGPointMake(ScreenW *idx, 0) animated:YES];
                }
                else if ([obj isEqualToString:@"回放"] && [button.currentTitle isEqualToString:@"回放"]){
                    [weakSelf.containCell.scrollView setContentOffset:CGPointMake(ScreenW *idx , 0) animated:YES];
                }
                
            }];
            
        };
        
    }
    return _itemView;
}



- (UIScrollView *)scrollView{
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        if (@available(iOS 11.0, *)) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
    }
    
    return _scrollView;
}


- (GestureTableView *)gestertable{
    
    if (!_gestertable) {
        _gestertable = [[GestureTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _gestertable.delegate = self;
        _gestertable.dataSource = self;
        _gestertable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _gestertable.showsVerticalScrollIndicator = NO;
        
        
        _gestertable.autoresizingMask = YES;
        PlayerView *playView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, ScreenW,H(200))];
        playView.backgroundColor = RGB(200, 100, 200);
        [self.view addSubview:playView];
        
        _gestertable.tableHeaderView = playView;
        [_gestertable registerClass:[ContainerCell class] forCellReuseIdentifier:ContainerCellID];
        [_gestertable registerClass:[AdvertiseCell class] forCellReuseIdentifier:AdvertiseCellid];
        
    }
    return _gestertable;
}




@end
