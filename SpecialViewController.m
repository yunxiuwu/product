//
//  SpecialViewController.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "SpecialViewController.h"
#import "SpecialModel.h"
#import "SpecialCell.h"
#import "UIImageView+WebCache.h"
#import "APPModel.h"
@interface SpecialViewController ()<NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation SpecialViewController
{
    NSURLConnection *_connection;
    NSMutableData *_responseData;
    NSMutableArray *_dataSource;
    UITableView *_tableView;
    NSMutableArray *_appArr;
    NSInteger _limit;
}
- (void)dealloc
{
    [_connection release];
    [_responseData release];
    [_dataSource release];
    [_tableView release];
    
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
     _responseData = [[NSMutableData alloc]init];
    _dataSource = [[NSMutableArray alloc]init];
    _limit = 1;
    [self requestData];
    
    [_tableView registerNib:[UINib nibWithNibName:@"SpecialCell" bundle:nil] forCellReuseIdentifier:@"SpecialCell"];
}
-(void)requestData
{
    NSString *strUrl = [NSString stringWithFormat:@"http://iappfree.candou.com:8080/free/special?page=%ld&limit=20",_limit];
    _limit++;
    
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"statuCode%ld",httpResponse.statusCode);
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError%@",error.localizedDescription);
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{

    NSDictionary *array = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
   
    for(NSDictionary *dict in array){
       SpecialModel *model = [[SpecialModel alloc]init];
        
        model.title = dict[@"title"];
        model.desc = dict[@"desc"];
        model.desc_img = dict[@"desc_img"];
        model.img = dict[@"img"];
        
        NSArray *arr = dict[@"applications"];
    
        for (NSDictionary *dict1 in arr) {
            APPModel *appModel = [[APPModel alloc]init];
            
            appModel.name = dict1[@"name"];
            appModel.iconUrl = dict1[@"iconUrl"];
            appModel.downloads = dict1[@"downloads"];
            appModel.comment = dict1[@"comment"];
            [model.appArray addObject:appModel];
        }
        [_dataSource addObject:model];
    }
    [_tableView reloadData];
}
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"SpecialCell";
    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
   
    SpecialModel *model = _dataSource[indexPath.row];

    cell.titleLabel.text = model.title;
    cell.xiaobianText.text = model.desc;
    [cell.BigImage setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    [cell.xiaobianIamge setImageWithURL:[NSURL URLWithString:model.desc_img] placeholderImage:[UIImage imageNamed:@"topic_Header"]];

    APPModel *appModel = model.appArray[0];
    cell.childLabel1.text = appModel.name;
    cell.downLabel1.text = appModel.downloads;
    cell.comLabel1.text = appModel.comment.stringValue;
    [cell.childImage1 setImageWithURL:[NSURL URLWithString:appModel.iconUrl] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    
    APPModel *appModel2 = model.appArray[1];
    cell.childLabel2.text = appModel2.name;
    cell.downLabel2.text = appModel2.downloads;
    cell.comLabel2.text = appModel2.comment.stringValue;
    [cell.childImage2 setImageWithURL:[NSURL URLWithString:appModel2.iconUrl] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    
    APPModel *appModel3 = model.appArray[2];
    cell.comLabel3.text = appModel3.comment.stringValue;
    cell.childLabel3.text = appModel3.name;
    cell.downLabel3.text = appModel3.downloads;
    [cell.childImage3 setImageWithURL:[NSURL URLWithString:appModel3.iconUrl] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    
    APPModel *appModel4 = model.appArray[3];
    cell.childLabel4.text = appModel4.name;
    cell.downLabel4.text = appModel4.downloads;
    cell.comLabel4.text = appModel4.comment.stringValue;
    [cell.childImage4 setImageWithURL:[NSURL URLWithString:appModel4.iconUrl] placeholderImage:[UIImage imageNamed:@"topic_TopicImage_Default"]];
    
    UIImageView *bcImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topic_Cell_Bg"]];
    cell.backgroundView = bcImageView;
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 360;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
