//
//  Merchantslist.m
//  zxics
//
//  Created by johnson on 14-8-11.
//  Copyright (c) 2014年 moko. All rights reserved.
//

#import "Merchantslist.h"
#import "merchantsCell.h"
#import "MerchantsDetail.h"
#import "MJRefresh.h"
#import "DataService.h"
#import "AppDelegate.h"
#import "Commons.h"

@interface Merchantslist ()

@end

@implementation Merchantslist

@synthesize merTview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.UINavigationBar setBackgroundImage:[UIImage imageNamed:@"logo_bg"] forBarMetrics:UIBarMetricsDefault];    
    page=1;
    list=[[NSMutableArray alloc]initWithCapacity:5];
    
    //加载数据
    [self loaddata];
    
    //上拉刷新下拉加载提示
    [merTview addHeaderWithCallback:^{
        [list removeAllObjects];
        page=1;
        [self loaddata];
        [merTview reloadData];
        [merTview headerEndRefreshing];}];
    [merTview addFooterWithCallback:^{
        page=page+1;
        [self loaddata];
        [merTview reloadData];
        [merTview footerEndRefreshing];
    }];
}

-(void)loaddata
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary * cp = [NSMutableDictionary dictionaryWithCapacity:5];
    cp=[DataService PostDataService:[NSString stringWithFormat:@"%@api/findProblem",domainser] postDatas:[NSString stringWithFormat:@"categoryId=93&communityid=%@",myDelegate.entityl.communityid] forPage:page forPageSize:10];
    NSArray *array=[cp objectForKey:@"datas"];
    [list addObjectsFromArray:array];
}

-(IBAction)goback:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

//初始化tableview数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
    //只有一组，数组数即为行数。
}

// tableview数据显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"merchantsCell";
    
    merchantsCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        NSArray * nib=[[NSBundle mainBundle]loadNibNamed:@"merchantsCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    NSDictionary *cpdetail = [list objectAtIndex:[indexPath row]];
    
    Commons *_commons=[[Commons alloc]init];
    cell.dateLabel.text=[_commons stringtoDate:[cpdetail objectForKey:@"createDate"]];
    cell.titleLabel.text=[cpdetail objectForKey:@"title"];
    
    return cell;
}

//tableview点击操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MerchantsDetail *_MerchantsDetail=[[MerchantsDetail alloc]init];
    NSDictionary *cpdetail = [list objectAtIndex:[indexPath row]];
    _MerchantsDetail.cpd=cpdetail;
    [self.navigationController pushViewController:_MerchantsDetail animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
