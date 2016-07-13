//
//  FreeViewController.m
//  LoveTheLimitOfFree
//
//  Created by WYX on 15-6-1.
//  Copyright (c) 2015年 WYX. All rights reserved.
//

#import "FreeViewController.h"
#import "APPModel.h"
#import "APPCell.h"
#import "UIImageView+WebCache.h"
@interface FreeViewController ()<NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation FreeViewController
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
    NSString *strUrl = @"http://10.0.8.10/app/qfts/iappfree/api/free.php?page=1&number=20";
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
        model.currentPrice = appDict[@"currentPrice"];
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
    cell.starCurrentLabel.text = [NSString stringWithFormat:@"评分:%@分",model.starCurrent];
    cell.lastPriceLabel.text = [NSString stringWithFormat:@"原价:￥%@",model.lastPrice];
    cell.ipaLabel.text = [NSString stringWithFormat:@"收藏:%@",model.ipa];
    cell.sharesLabel.text = [NSString stringWithFormat:@"分享:%@",model.shares];
    cell.downloadsLabel.text = [NSString stringWithFormat:@"下载:%@",model.downloads];
    cell.catagoryNameLabel.text = model.categoryName;
cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell.UIImageNameLabel setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"cate_list_bg1@2x"]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87;
}

@end
