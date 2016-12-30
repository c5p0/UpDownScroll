//
//  ViewController.m
//  定时弹跳Cell
//
//  Created by duxiaoqiang on 16/12/30.
//  Copyright © 2016年 professional. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PopView *pop = [[PopView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 70)];
    pop.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pop];
    self.view.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


@end
