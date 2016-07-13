//
//  LimitViewController.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "LimitViewController.h"
#import "APPModel.h"
#import "APPCell.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"
@interface LimitViewController ()<NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation LimitViewController
{
    NSURLConnection *_connection;
    NSMutableData *_responseData;
    NSMutableArray *_dataSource;
    UITableView *_tableView;
    
}
- (void)dealloc
{
    [_connection release];
    [_responseData release];
    [_dataSource release];
    [_tableView release];
    
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTableView];
    
    _dataSource = [[NSMutableArray alloc]init];
    _responseData = [[NSMutableData alloc]init];
    [self requestData];
}
-(void)requestData
{
    NSString *strUrl = @"http://10.0.8.10/app/qfts/iappfree/api/limited.php?page=1&number=20";
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
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *appDict in dict[@"applications"]) {
        APPModel *model = [[APPModel alloc]init];
        model.name = appDict[@"name"];
        model.categoryName = appDict[@"categoryName"];
        model.expireDatetime = appDict[@"expireDatetime"];
        model.lastPrice = appDict[@"lastPrice"];
        model.downloads = appDict[@"downloads"];
        model.ipa = appDict[@"ipa"];
        model.shares = appDict[@"shares"];
        model.starCurrent = appDict[@"starCurrent"];
        model.iconUrl = appDict[@"iconUrl"];
        [_dataSource addObject:model];
        [model release];
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
    static NSString *cellId = @"cellId";
    APPCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"APPCell" owner:self options:nil]lastObject];
    }
    APPModel *model = _dataSource[indexPath.row];
    cell.nameLabel.text = model.name;
    
    NSArray *array = [model.expireDatetime componentsSeparatedByString:@" "];
    NSString *str = [array objectAtIndex:1];
    cell.expireDatetimeLabel.text = [NSString stringWithFormat:@"剩余:%@",str];
 
    cell.lastPriceLabel.text = [NSString stringWithFormat:@"原价:￥%@元",model.lastPrice];
    cell.ipaLabel.text = [NSString stringWithFormat:@"收藏:%@次",model.ipa];
    cell.sharesLabel.text = [NSString stringWithFormat:@"分享:%@次",model.shares];
    cell.downloadsLabel.text = [NSString stringWithFormat:@"下载:%@次",model.downloads];
    cell.catagoryNameLabel.text = model.categoryName;
    [cell.starCurrent setImageWithURL:[NSURL URLWithString:model.starCurrent]];
    
    [cell.UIImageNameLabel setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"cate_list_bg1@2x"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc]init];
    
    
}
@end
