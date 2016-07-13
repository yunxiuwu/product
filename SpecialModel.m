//
//  SpecialModel.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-4.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "SpecialModel.h"
#import "APPModel.h"
@implementation SpecialModel
{
    NSMutableArray *_appArr;
}
- (void)dealloc
{
    self.title = nil;
    self.data = nil;
    self.desc = nil;
    self.desc_img = nil;
    self.img = nil;
    self.name = nil;
    self.comment = nil;
    self.downloads = nil;
    self.iconUrl = nil;
    self.appArray = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        _appArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void) addApplication:(APPModel *)appModel {
    [_appArr addObject:appModel];
}
- (NSArray *) getAllApplications {
    return [_appArr copy];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
