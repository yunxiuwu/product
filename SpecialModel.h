//
//  SpecialModel.h
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-4.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPModel.h"
@interface SpecialModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *data;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *desc_img;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;



@property (nonatomic,copy)NSString *comment;
@property (nonatomic,copy)NSString *downloads;
@property (nonatomic,copy)NSString *iconUrl;
@property(nonatomic,retain)NSMutableArray *appArray;

- (void) addApplication:(APPModel *)appModel;
- (NSArray *) getAllApplications;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
