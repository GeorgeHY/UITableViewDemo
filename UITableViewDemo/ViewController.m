//
//  ViewController.m
//  UITableViewDemo
//
//  Created by ezt on 15/11/5.
//  Copyright © 2015年 GE. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "Constant.h"
#import "Cell_Teacher.h"

static  NSString * cellIdentifier = @"cell";


@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自动调整scrollview的insets
    //UITableView的superclass 是UIScrollView
    //不关闭的话 ，有时tableview的origin point会出现问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initData];
    [self createUI];
}

- (void)initData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TeacherList" ofType:@"plist"];
    self.dataArr = [NSMutableArray arrayWithContentsOfFile:plistPath];
    NSLog(@"arr = %@",self.dataArr);
}


- (void)createUI
{
    
    //64是navibar的高度加上statusbar的高度
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource
//每个区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


//绘制cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell_Teacher * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[Cell_Teacher alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    
    
    NSDictionary * dict = self.dataArr[indexPath.row];
    Model_Teacher * curModel = [[Model_Teacher alloc]initWithDictionary:dict error:nil];
    cell.model = curModel;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
