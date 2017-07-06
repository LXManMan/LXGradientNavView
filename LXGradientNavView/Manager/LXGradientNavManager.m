//
//  LXGradientNavManager.m
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXGradientNavManager.h"

@interface LXGradientNavManager()
@property (nonatomic, strong) UINavigationBar *selfNavigationBar;
@property (nonatomic, strong) UINavigationController *selfNavigationController;
@end
@implementation LXGradientNavManager
+(LXGradientNavManager *)sharedManager{
    
    static LXGradientNavManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LXGradientNavManager alloc]init];
    });
    return manager;
}

+(void)managerWithController:(UIViewController *)viewController{
    
    if (viewController.navigationController) {
        UINavigationBar *navigationBar = viewController.navigationController.navigationBar;
        [self sharedManager].selfNavigationBar = navigationBar;
        [self sharedManager].selfNavigationController = viewController.navigationController;
        [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [navigationBar setShadowImage:[UIImage new]];
    }
}

+(void)dealGradientWithScrollView:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    
    UIColor *defaultColor = [self sharedManager].defaultColor;

    if (y > [self sharedManager].fullAlphaOffset) {
        UIImage *image =[self imageWithColor:defaultColor];

        [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }else{
        CGFloat alpha = y /[self sharedManager].fullAlphaOffset;
        UIImage *image =[self imageWithColor: [defaultColor colorWithAlphaComponent:alpha]];
        [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    }

}

+ (void)reStoreToSystemNavigationBar {
    [[self sharedManager].selfNavigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}
+ (void)resStoreToDefaultNavigationBar{
    UIImage *image =[self imageWithColor:[self sharedManager].defaultColor];

    [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
+(void)setZeroAlphaOffset:(float)offset{
    [self sharedManager].zeroAlphaOffset = offset;
    
}
+(void)setFullAlphaOffset:(float)offset{
    [self sharedManager].fullAlphaOffset = offset;
}
+(void)setDefaultColor:(UIColor *)color{
    [self sharedManager].defaultColor = color;
    
   
    
}
+(void)setOrignColor:(UIColor *)color{
    [self sharedManager].orignColor = color;
    
    [[self sharedManager].selfNavigationBar setBackgroundImage:[self imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    

    
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}

@end
