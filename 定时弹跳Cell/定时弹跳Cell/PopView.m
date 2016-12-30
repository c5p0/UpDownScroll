//
//  PopView.m
//  定时弹跳Cell
//
//  Created by duxiaoqiang on 16/12/30.
//  Copyright © 2016年 professional. All rights reserved.
//

#import "PopView.h"

@interface PopView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSTimer *time;
@property (nonatomic,strong) NSMutableArray *name;
@property (nonatomic,assign) NSInteger curIndex;
@property (nonatomic,strong) NSArray *arr;
@end
@implementation PopView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
         self.arr = @[@"4",@"1", @"2", @"3",@"4"];
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.rowHeight= 70;
        [self addSubview:self.tableView];
       
        self.time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeCell) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}


- (void)changeCell
{
    self.curIndex ++;
    if (self.curIndex > 3) {
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
        self.curIndex = 0;
    }
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.curIndex inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)dealloc
{
    [self.time invalidate];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell== nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *detail = [NSString stringWithFormat:@"ceshi%@",self.arr[indexPath.row]];
    cell.textLabel.text = detail;
    return cell;
}

@end
