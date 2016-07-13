//
//  SpecialCell.h
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-3.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;

@property (retain, nonatomic) IBOutlet UIImageView *BigImage;

@property (retain, nonatomic) IBOutlet UIImageView *xiaobianIamge;
@property (retain, nonatomic) IBOutlet UITextView *xiaobianText;


@property (retain, nonatomic) IBOutlet UIImageView *childImage1;
@property (retain, nonatomic) IBOutlet UILabel *childLabel1;

@property (retain, nonatomic) IBOutlet UILabel *comLabel1;


@property (retain, nonatomic) IBOutlet UILabel *downLabel1;

@property (retain, nonatomic) IBOutlet UIImageView *childImage2;
@property (retain, nonatomic) IBOutlet UILabel *childLabel2;

@property (retain, nonatomic) IBOutlet UILabel *comLabel2;

@property (retain, nonatomic) IBOutlet UILabel *downLabel2;




@property (retain, nonatomic) IBOutlet UIImageView *childImage3;
@property (retain, nonatomic) IBOutlet UILabel *childLabel3;

@property (retain, nonatomic) IBOutlet UILabel *comLabel3;

@property (retain, nonatomic) IBOutlet UILabel *downLabel3;


@property (retain, nonatomic) IBOutlet UIImageView *childImage4;
@property (retain, nonatomic) IBOutlet UILabel *childLabel4;

@property (retain, nonatomic) IBOutlet UILabel *comLabel4;

@property (retain, nonatomic) IBOutlet UILabel *downLabel4;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
