//
//  IntroduceController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "IntroduceController.h"

@interface IntroduceController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong , nonatomic) UITableView *tableView;
@end

@implementation IntroduceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 25)];
    label.font = FONT(14);
    label.text = @"我是简介页面......我是简介页面.....";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGB(51, 51, 51);
    [self.view addSubview:label];
    self.view.backgroundColor = RGB(100, 100, 200);
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(200, 200, 200, 200);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//
//
//    [self.view addSubview:self.tableView];
    
    
}


- (void)buttonAction:(UIButton *)sender{
    
    NSDictionary *dict = @{@"":@""};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeItems" object:nil userInfo:dict];
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    if (!self.isScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    
    if (scrollView.contentOffset.y <= 0) {
        self.isScroll = NO;
        scrollView.contentOffset = CGPointZero;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];
        
    }
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}










@end
