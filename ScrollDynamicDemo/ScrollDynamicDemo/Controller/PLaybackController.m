//
//  PLaybackController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "PLaybackController.h"

@interface PLaybackController ()

@end
@implementation PLaybackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 25)];
    label.font = FONT(14);
    label.text = @"我是回放页面......我是回放页面......我是回放页面......我是回放页面......";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGB(51, 51, 51);
    [self.view addSubview:label];

    self.view.backgroundColor = [UIColor whiteColor];
}


@end
