//
//  UIView+Extension.m
//  YiMaMa
//
//  Created by yimama（技术） on 16/1/8.
//  Copyright © 2016年 YiMaMa. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

@dynamic downy;

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)rightx
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)downy
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

+ (UIFont *)adjustFont:(CGFloat )fontsize {
    return [self adjustFont:fontsize weight:UIFontWeightRegular];
}

+ (UIFont *)adjustFont:(CGFloat )fontsize weight:(CGFloat )weight{
    return [UIFont systemFontOfSize:[self adjustFontSize:fontsize] weight:weight];
}

+ (UIFont *)adjustFontWithName:(NSString *)fontName size:(CGFloat )size{
    return [UIFont fontWithName:fontName size:[self adjustFontSize:size]];
}

+ (CGFloat )adjustFontSize:(CGFloat )size{
    if (IS_IPHONE_5) {
        return size - IPHONE6_INCREMENT;
    }else if (IS_IPHONE_6 || IS_IPHONE_X) {
        return size;
    }else if (IS_IPHONE_6_PLUS) {
        return size + IPHONE6PLUS_INCREMENT;
    }else if (IS_IPAD) {
        return size + IPAD_INCREMENT;
    }
    return size;
}

+ (CGFloat)adjustWidth:(CGFloat)width {
    if ([[CGHSystemManager platform] containsString:@"iPad"]) {
        
    }
    
    return width / 375 * SCREEN_WIDTH;
}

+ (CGFloat)adjustHeight:(CGFloat)height {
    if ([[CGHSystemManager platform] containsString:@"iPad"]) {
        
    }

    return height / 667 * SCREEN_HEIGHT;
}

+ (CGSize)adjustSize:(CGSize)size{
    
    if (IS_IPHONE_5 || IS_IPHONE_6 || IS_IPHONE_X || IS_IPHONE_6_PLUS) {
        return CGSizeMake([UIView adjustWidth:size.width], [UIView adjustWidth:size.height]);
    }else if (IS_IPAD ){
        
    }
    
    return CGSizeMake([UIView adjustWidth:size.width], [UIView adjustWidth:size.height]);
}


- (UITableView *)superTableView {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UITableView class]]) {
            return (UITableView *)nextResponder;
        }
    }
    
    return nil;
}
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    if ([window subviews].count > 0) {
        UIView *frontView = [[window subviews] objectAtIndex:0];
        id nextResponder = [frontView nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            result = nextResponder;
        else
            result = window.rootViewController;
        
        return result;
    }else{
        return nil;
    }
}

+ (UIViewController *)nowTopViewController{
    UIViewController *main = [UIView getCurrentVC];
    
    if ([main isKindOfClass:[UITabBarController class]]) {
        UIViewController *sub = ((UITabBarController *)main).selectedViewController;
        if ([sub isKindOfClass:[UINavigationController class]]) {
            
            UIViewController *top = ((UINavigationController *)sub).topViewController;
            
            
            return top;
        }else{
            return sub;
        }
    }else{
        if ([main isKindOfClass:[UINavigationController class]]) {
            
            UIViewController *top = ((UINavigationController *)main).topViewController;
            
            
            return top;
        }else{
            return main;
        }
    }
}

- (UIViewController *)behideTopViewController {
    
    if (self.viewController.navigationController == nil) {
        
    }else{
        NSArray *vcs = self.viewController.navigationController.viewControllers;
        if (vcs.count > 1) {
          return [vcs objectAtIndex:vcs.count - 2];
        }
    }
    
    return nil;
}




@end
