//
//  MemberController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "MemberController.h"

@interface MemberController ()

@end

@implementation MemberController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 25)];
    label.font = FONT(14);
    label.text = @"我是成员页面......";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGB(51, 51, 51);
    [self.view addSubview:label];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
