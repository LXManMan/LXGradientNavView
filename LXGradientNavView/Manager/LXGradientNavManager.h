//
//  LXGradientNavManager.h
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LXGradientNavManager : NSObject
@property(nonatomic,strong)UIColor *defaultColor; //默认的Nav的颜色

@property(nonatomic,strong)UIColor *orignColor; //最开始的颜色

@property(nonatomic,assign)float zeroAlphaOffset;

@property (nonatomic, assign) float fullAlphaOffset;

+(void)setOrignColor:(UIColor *)color;

+ (void)setDefaultColor:(UIColor *)color;

+ (void)setZeroAlphaOffset:(float)offset;

+ (void)setFullAlphaOffset:(float)offset;


+(void)managerWithController:(UIViewController *)viewController;

+(void)dealGradientWithScrollView:(UIScrollView *)scrollView;

+(void)reStoreToSystemNavigationBar; //change the navigationBar to system style

+(void)resStoreToDefaultNavigationBar; //恢复到默认的navbar

@end
