//
//  APPModel.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "APPModel.h"

@implementation APPModel
- (void)dealloc
{
    self.name = nil;
    self.categoryName = nil;
    self.currentPrice = nil;
    self.lastPrice = nil;
    self.shares = nil;
    self.ipa = nil;
    self.starCurrent = nil;
    self.downloads = nil;
    self.iconUrl = nil;
    self.expireDatetime= nil;
    self.title = nil;
    self.desc = nil;
    self.desc_img = nil;
    self.comment = nil;
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

@end
