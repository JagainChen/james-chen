//
//  CGHSystemManager.h
//  惠多多
//
//  Created by Jagain on 17/4/12.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import "CGHBaseManager.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIView+Extension.h"
#import "UIViewController+AlertVC.h"


#define CGHDateFormatter @"yyyyMMddHHmmss"

@interface CGHSystemManager : CGHBaseManager

/**
 * @brief 判断当前手机相册权限.
 *
 * @return 手机相册权限打开与否.
 */
+ (BOOL)isAvailableToPhotoLibrary;

/**
 * @brief 判断当前相机权限.
 *
 * @return 相机权限打开与否.
 */
+ (BOOL)isAvailableToCamera;

/**
 * @brief 打印当前有关的app信息.
*/
+ (void)printTheAppInfomation;

/**
 * @brief 计算两个时间的间隔，时间超过一小时，发送APP_SHOULD_RELOAD_DATA通知.
 *
 * @param firstDate 起始时间.
 * @param secondDate 结束时间.
 */
+ (void)caculateOfTheDate:(NSDate *)firstDate withTheSecondDate:(NSDate *)secondDate;

+ (NSString *)appVersion;
+ (NSString *)platform;

@end
