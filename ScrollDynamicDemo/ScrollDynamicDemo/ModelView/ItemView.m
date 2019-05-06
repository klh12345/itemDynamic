//
//  ItemView.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, ScreenW, scrollHeaderHeight);
        self.backgroundColor = RGB(200, 200, 200);
        
    }
    return self;
    
}

- (void)setItems:(NSArray *)items{
    _items = items;
    for (int i = 0; i <self.items.count; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:RGB(30, 100, 200) forState:UIControlStateSelected];
        button.titleLabel.font = FONT(13);
        [button setTitle:self.items[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonselecter:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(ScreenW/self.items.count * i, 0,ScreenW/self.items.count, 35);
        button.tag = i + 100;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
        [self addSubview:button];
        [self addSubview:self.line];
        
        [self.totalButton addObject:button];
        
        if (i==0) {
            button.selected = YES;
            self.currentButton = button;
            button.titleLabel.font = FONT(14);
            self.line.center = button.center;
            self.line.frame = CGRectMake(button.frame.origin.x, button.frame.size.height + 2, button.frame.size.width, 1);
        }
        
    }
    
}



- (void)buttonselecter:(UIButton *)sener{
    
    if (self.buttonAction) {
        self.buttonAction(sener);
    }
    
}


- (UIView *)line{
    
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = RGB(30, 100, 200);
        
    }
    return _line;
}


- (NSMutableArray *)totalButton{
    
    if (!_totalButton) {
        _totalButton = [NSMutableArray array];
    }
    return _totalButton;
}



@end
