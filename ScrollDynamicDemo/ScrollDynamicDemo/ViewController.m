//
//  ViewController.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/8.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "ViewController.h"
#import "ScrollController.h"


@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i <= 5; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[NSString stringWithFormat:@"文字%d",i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        button.frame = CGRectMake(50, 100 * i, 100, 50);
        [button addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = FONT(13);
        [button setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        button.tag = 100 + i;
        [self.view addSubview:button];
    }
    
    for (int i = 0; i <= 5; i ++) {
        UIButton *image = [UIButton buttonWithType:UIButtonTypeCustom];
        [image setTitle:[NSString stringWithFormat:@"图片%d",i] forState:UIControlStateNormal];
        [image setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        [image setBackgroundColor:[UIColor whiteColor]];
        image.frame = CGRectMake(200, 100 *i, 100, 50);
        [image addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
        image.tag = 100 + i;
        image.titleLabel.font = FONT(13);
        [self.view addSubview:image];
    }
    
}




- (void)nextPage:(UIButton *)sender{
    
    ScrollController *control = [[ScrollController alloc] init];
    if ([sender.currentTitle isEqualToString:@"文字1"]) {
        control.kind = NO;
        control.itemsarray =  @[@"简介"];
    }
    else if ([sender.currentTitle isEqualToString:@"文字2"]){
        control.kind = NO;
        control.itemsarray =  @[@"简介",@"聊天"];
    }
    else if ([sender.currentTitle isEqualToString:@"文字3"]){
        control.kind = NO;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单"];
    }
    else if ([sender.currentTitle isEqualToString:@"文字4"]){
        control.kind = NO;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单",@"成员"];
    }
    else if ([sender.currentTitle isEqualToString:@"文字5"]){
        control.kind = NO;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单",@"成员",@"回放"];
    }
    else if ([sender.currentTitle isEqualToString:@"图片1"]){
        
        control.kind = YES;
        control.itemsarray =  @[@"简介"];
    }
    else if ([sender.currentTitle isEqualToString:@"图片2"]){
        control.kind = YES;
        control.itemsarray =  @[@"简介",@"聊天"];
    }
    else if ([sender.currentTitle isEqualToString:@"图片3"]){
        control.kind = YES;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单"];
    }
    else if ([sender.currentTitle isEqualToString:@"图片4"]){
        control.kind = YES;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单",@"成员"];
    }
    else if ([sender.currentTitle isEqualToString:@"图片5"]){
        control.kind = YES;
        control.itemsarray =  @[@"简介",@"聊天",@"榜单",@"成员",@"互动"];
    }
    [self.navigationController pushViewController:control animated:YES];
    
    
    
    
}

@end
