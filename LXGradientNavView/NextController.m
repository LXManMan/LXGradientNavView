//
//  NextController.m
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NextController.h"
#import "LXGradientNavManager.h"

@interface NextController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation NextController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [LXGradientNavManager resStoreToDefaultNavigationBar];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setUp];
    
    [LXGradientNavManager managerWithController:self];
    
    [LXGradientNavManager setOrignColor:[UIColor clearColor]];
    
    [LXGradientNavManager setZeroAlphaOffset:0];
    [LXGradientNavManager setFullAlphaOffset:self.tableView.tableHeaderView.height];
    [LXGradientNavManager setDefaultColor:[UIColor hexStringToColor:@"F9F9F9"]];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [LXGradientNavManager dealGradientWithScrollView:scrollView];
    
}


-(void)setUp{
    
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView  dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"哈嘎两人经过";
    return cell;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, 257)];
        imageView.image =[UIImage imageNamed:@"banner"];
        _tableView.tableHeaderView = imageView;
        _tableView.tableFooterView =[UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
