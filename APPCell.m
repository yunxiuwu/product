//
//  APPCell.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-2.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "APPCell.h"

@implementation APPCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_UIImageNameLabel release];
    [_nameLabel release];
    [_currentPriceLabel release];
    [_sharesLabel release];
    [_ipaLabel release];
    [_lastPriceLabel release];
    [_catagoryNameLabel release];
    [_downloadsLabel release];
    [_starCurrent release];
    [_expireDatetimeLabel release];
    [_starCurrentLabel release];
    [super dealloc];
}
@end
