//
//  AdvertiseCell.h
//  ScrollDynamicDemo
//
//  Created by 中国孔 on 2019/4/10.
//  Copyright © 2019 孔令辉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdvertiseCell : UITableViewCell

@property (strong , nonatomic) NSArray *showContent;
@property (strong , nonatomic) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
