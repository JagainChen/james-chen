//
//  UIView+Extension.h
//  YiMaMa
//
//  Created by yimama（技术） on 16/1/8.
//  Copyright © 2016年 YiMaMa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IPHONE6_INCREMENT 2
#define IPHONE6PLUS_INCREMENT 1
#define IPAD_INCREMENT 4
/* 判断设备 */
#define IS_IPHONE_5 ([UIScreen mainScreen].bounds.size.height == 568.0f)
#define IS_IPHONE_6 ([UIScreen mainScreen].bounds.size.height == 667.0f)
#define IS_IPHONE_6_PLUS ([UIScreen mainScreen].bounds.size.height == 736.0f)
#define IS_IPHONE_X ([UIScreen mainScreen].bounds.size.height == 812.0f)
#define IS_IPAD ([UIScreen mainScreen].bounds.size.height == 1024.0f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
#define NAVIGATION_BAR_HEIGHT (IS_IPHONE_X ? 88 : 64)
#define NAVIGATION_TABBAR_HEIGHT (IS_IPHONE_X ? 83 : 48)
#define TABBAR_BOTTOM_HEIGHT (IS_IPHONE_X ? 35 : 0)

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign, readonly) CGFloat rightx;
@property (nonatomic, assign) CGFloat downy;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

/**
 * @brief 得到当前view所属的viewController.
 */
- (UIViewController *)viewController;

/**
 * @brief 得到当前的tableView.
 */
- (UITableView *)superTableView;

/**
 * @brief 得到对应屏幕大小的字体.
 * @param fontsize 字体的大小
 */
+ (UIFont *)adjustFont:(CGFloat )fontsize;
+ (UIFont *)adjustFont:(CGFloat )fontsize weight:(CGFloat )weight;
+ (UIFont *)adjustFontWithName:(NSString *)fontName size:(CGFloat )size;

/**
 * @brief 得到对应屏幕宽度.
 * @param width 宽度
 */
+ (CGFloat)adjustWidth:(CGFloat)width;
/**
 * @brief 得到对应屏幕高度.
 * @param height 高度
 */
+ (CGFloat)adjustHeight:(CGFloat)height;
/**
 * @brief 得到对应屏幕size.
 * @param size 高度
 */
+ (CGSize)adjustSize:(CGSize)size;

/**
 * @brief 得到当前显示的viewController.
 */
+ (UIViewController *)getCurrentVC;

/**
 * @brief 得到当前显示在最上方的viewController.
 */
+ (UIViewController *)nowTopViewController;
//得到naviController前面一个controller
- (UIViewController *)behideTopViewController;

@end
