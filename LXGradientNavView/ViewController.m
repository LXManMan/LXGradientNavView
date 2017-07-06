//
//  ViewController.m
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "ViewController.h"
#import "NextController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button  =[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor =[UIColor blueColor];
    [button setTintColor:[UIColor blackColor]];
    [button setTitle:@"渐变NAvBar" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 100, 200, 40);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
}
-(void)Click{
    NextController *nextVc =[[NextController alloc]init];
    [self.navigationController pushViewController:nextVc animated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
