//
//  AdvertiseItems.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AdvertiseItems : UICollectionViewCell

@property (strong , nonatomic) UILabel *labels;
@property (strong , nonatomic) UIImageView *icons;

@property (strong , nonatomic) UILabel *scrollLabel;




@property (strong , nonatomic) NSString *items;


@end

NS_ASSUME_NONNULL_END
