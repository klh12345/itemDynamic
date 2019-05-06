//
//  AdvertiseCell.m
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import "AdvertiseCell.h"

#import "AdvertiseIconItems.h"
#import "AdvertiseScroltems.h"
#import "AdvertiseItems.h"
@interface AdvertiseCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong , nonatomic) UICollectionView *collectionView;

@end
static NSString *const AdvertiseScroltemsID = @"AdvertiseScroltems";
static NSString *const AdvertiseIconItemsID = @"AdvertiseIconItems";
static NSString *const AdvertiseItemsID = @"AdvertiseItems";
@implementation AdvertiseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.collectionView];
        [self addtimer];
    }
    return self;
}

- (void)addtimer{
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    _timer = [NSTimer timerWithTimeInterval:20 target:self selector:@selector(nextPage) userInfo:NULL repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)nextPage{
    
    NSIndexPath *indexpath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSIndexPath *currntIndex =[NSIndexPath indexPathForItem:indexpath.item inSection:indexpath.section];
    [self.collectionView scrollToItemAtIndexPath:currntIndex atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    // 用户加入拖拽手势 查找拖拽目录手势完成从拖拽点开始l轮播
    // 下一个indexpath
    NSInteger nextIndex = currntIndex.item + 1;
    NSInteger currentSection = currntIndex.section;
   
    if (nextIndex == 5) {
        nextIndex = 0;
        currentSection ++;
    }

    NSIndexPath *index = [NSIndexPath indexPathForItem:nextIndex inSection:currentSection];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
    
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self addtimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.timer invalidate];
}

- (void)setShowContent:(NSArray *)showContent{
    _showContent = showContent;
    
    

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  5;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = @[@"1.首个显示http",@"2.杭州迈可行通信股份有限公司为您提供现场直播!",@"3.杭州迈可行通信股份有限公司为您提供现场直播!杭州迈可行通信股份有限公司为您提供现场直播!",@"4.http中间显示",@"5.美博云直播通知栏详情展示"];
    NSArray *images = @[@"dt_di_slices",@"gt_di_slices",@"icon1",@"pt_di_slices",@"icon2"];
    
    NSString *str = array[indexPath.row];
    
    if ([str containsString:@"http"]) {
        AdvertiseIconItems *iconCells = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseIconItemsID forIndexPath:indexPath];
        if (!iconCells) {
            iconCells = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseIconItemsID forIndexPath:indexPath];
        }
        
        [iconCells setImageName:str];
        return iconCells;
        
    }else{
        
        if ([NSString islargeScreenWithText:str font:12]) {
            
            AdvertiseScroltems *scrollItems = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseScroltemsID forIndexPath:indexPath];
            if (!scrollItems) {
                scrollItems = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseScroltemsID forIndexPath:indexPath];
            }
            [scrollItems setLabelName:str];
            
            return scrollItems;
        }else{
            
            AdvertiseItems *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseItemsID forIndexPath:indexPath];
            if (!cell) {
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:AdvertiseItemsID forIndexPath:indexPath];
            }
            
            [cell setItems:str];
            return cell;
            
            
        }
    
    }
    
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(ScreenW, 25);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 25) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        
        [_collectionView registerClass:[AdvertiseItems class] forCellWithReuseIdentifier:AdvertiseItemsID];
        [_collectionView registerClass:[AdvertiseIconItems class] forCellWithReuseIdentifier:AdvertiseIconItemsID];
        [_collectionView registerClass:[AdvertiseScroltems class] forCellWithReuseIdentifier:AdvertiseScroltemsID];
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
       
        
    }
    
    return _collectionView;
}






@end
