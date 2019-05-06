//
//  AdvertiseScroltems.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/11.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdvertiseScroltems : UICollectionViewCell


@property (strong , nonatomic) UILabel *scrollLabel;
@property (strong , nonatomic) NSString *labelName;


//- (void)addAnimation;

@property (assign , nonatomic) BOOL animatonStop;


@end

NS_ASSUME_NONNULL_END
