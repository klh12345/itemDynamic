//
//  ChatController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "ChatController.h"

@interface ChatController ()

@end

@implementation ChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 25)];
    label.font = FONT(14);
    label.text = @"我是聊天页面......";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGB(51, 51, 51);
    [self.view addSubview:label];

    self.view.backgroundColor = RGB(100, 100, 30);
    
}


@end
