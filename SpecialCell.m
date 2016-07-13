//
//  SpecialCell.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-3.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "SpecialCell.h"

@implementation SpecialCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_titleLabel release];
    [_BigImage release];
    [_xiaobianIamge release];
    [_xiaobianText release];
    
    [_childImage1 release];
    [_childImage2 release];
    [_childImage3 release];
    [_childImage4 release];
   
    [_childLabel1 release];
    [_childLabel2 release];
    [_childLabel3 release];
    [_childLabel4 release];
    

    
    [_comLabel1 release];
    [_comLabel2 release];
    [_comLabel3 release];
    [_comLabel4 release];
    
    [_downLabel1 release];
    [_downLabel2 release];
    [_downLabel3 release];
    [_downLabel4 release];
    
    
   
    [super dealloc];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
