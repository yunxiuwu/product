//
//  APPCell.h
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-2.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *UIImageNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (retain, nonatomic) IBOutlet UILabel *sharesLabel;
@property (retain, nonatomic) IBOutlet UILabel *ipaLabel;
@property (retain, nonatomic) IBOutlet UILabel *lastPriceLabel;
@property (retain, nonatomic) IBOutlet UILabel *catagoryNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *downloadsLabel;
@property (retain, nonatomic) IBOutlet UIImageView *starCurrent;
@property (retain, nonatomic) IBOutlet UILabel *expireDatetimeLabel;
@property (retain, nonatomic) IBOutlet UILabel *starCurrentLabel;

@end
