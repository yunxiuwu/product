//
//  APPModel.h
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *categoryName;
@property (nonatomic,copy)NSString *currentPrice;
@property (nonatomic,copy)NSString *lastPrice;
@property (nonatomic,copy)NSString *shares;
@property (nonatomic,copy)NSString *ipa;
@property (nonatomic,copy)NSString *starCurrent;
@property (nonatomic,copy)NSString *downloads;
@property (nonatomic,copy)NSString *iconUrl;
@property (nonatomic,copy)NSString *expireDatetime;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *desc_img;
@property (nonatomic,copy)NSNumber *comment;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
