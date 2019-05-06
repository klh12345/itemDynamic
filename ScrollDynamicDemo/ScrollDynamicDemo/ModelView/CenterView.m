//
//  CenterView.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/9.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "CenterView.h"

@interface CenterView ()<SDCycleScrollViewDelegate>
@property (strong , nonatomic) SDCycleScrollView *imagesdView;
@property (strong , nonatomic) SDCycleScrollView *labelsdView;


@end

@implementation CenterView


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
       
    }
    
    return self;
}

- (void)showImageView{
    
    NSArray *imageArray = @[@"icon1",@"美博云主机专属展示信息",@"icon01",@"底部展示信息区域,这只是提示信息",@"icon2"];
    //    NSArray *imageUrlarray = @[@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
    //                               @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
    //                               @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
    //                               @"http://img3.qianzhan123.com/news/201409/15/20140915-2b319c7d7cf0ad8a_550x1300.jpg"];
    self.imagesdView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, 30) imageNamesGroup:imageArray];
    
    self.imagesdView.autoScrollTimeInterval = 2.0f;
    self.imagesdView.pageControlDotSize = CGSizeMake(8, 8);
    
    self.imagesdView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.imagesdView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    [self addSubview:self.imagesdView];

    
}


- (void)showLabelView{
    
    self.labelsdView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, 25) delegate:self placeholderImage:nil];
    self.labelsdView.onlyDisplayText = YES;
    self.labelsdView.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.labelsdView.autoScrollTimeInterval = 3.0f;
    self.labelsdView.titlesGroup = @[@"美播云企业企业直播平台，大平台 就是有保障",@"企业级的直播解决方案,定制化的直播场景",@"最新最高效的互动解决方案,多媒体融合的交互模式",@"企业级的直播平台，只待你来"];
    self.labelsdView.titleLabelTextColor = RGB(51, 51, 51);
    self.labelsdView.titleLabelTextFont = FONT(11);
    [self addSubview:self.labelsdView];
    
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{}


@end
