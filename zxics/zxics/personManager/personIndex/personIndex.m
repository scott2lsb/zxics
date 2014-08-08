//
//  personIndex.m
//  zxics
//
//  Created by johnson on 14-8-6.
//  Copyright (c) 2014年 moko. All rights reserved.
//

#import "personIndex.h"

@interface personIndex ()

@end

@implementation personIndex

@synthesize UINavigationBar;
@synthesize UINavigationItem;

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
    [self.UINavigationBar setBarTintColor:[UIColor colorWithRed:7.0/255.0 green:3.0/255.0 blue:164.0/255.0 alpha:1]];//设置bar背景颜色
    self.UINavigationItem.title=@"个人管理";
    
}

//首页页面跳转
-(IBAction)fontindex:(id)sender
{
    fontindex * _fontindex=[[fontindex alloc] init];
    
    [self.navigationController pushViewController:_fontindex animated:NO];
}

//个人信息
-(IBAction)personinfo:(id)sender
{
    personInfo * _personInfo=[[personInfo alloc] init];
    
    [self.navigationController pushViewController:_personInfo animated:NO];
}


//个人日志
-(IBAction)personlog:(id)sender
{
    personLog * _personLog=[[personLog alloc] init];
    
    [self.navigationController pushViewController:_personLog animated:NO];
}

//欠费（缴费）查询页面跳转
-(IBAction)arrearagelist:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSInteger btntag=btn.tag;
    arrearagecheck * _arrearagecheck=[[arrearagecheck alloc] init];
    _arrearagecheck.btntag=[NSString stringWithFormat:@"%d",btntag];
    [self.navigationController pushViewController:_arrearagecheck animated:NO];
}

//消费查询，停车记录页面跳转
-(IBAction)consumelist:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    NSInteger btntag=btn.tag;
    consumelist * _consumelist=[[consumelist alloc] init];
    _consumelist.btntag=[NSString stringWithFormat:@"%d",btntag];
    [self.navigationController pushViewController:_consumelist animated:NO];
}

//余额查询
-(IBAction)balancelist:(id)sender
{
    balancelist * _balancelist=[[balancelist alloc] init];
    
    [self.navigationController pushViewController:_balancelist animated:NO];
}

//会员中心页面跳转
-(IBAction)membercenter:(id)sender
{
    membercenter * _membercenter=[[membercenter alloc] init];
    
    [self.navigationController pushViewController:_membercenter animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end