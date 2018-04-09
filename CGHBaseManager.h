//
//  CGHBaseManager.h
//  惠多多
//
//  Created by Jagain on 17/3/10.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CarBrandListCache @"carBrandListCache"
#define CarBrandDetailCacheWithId(brnad_id) [NSString stringWithFormat:@"brand_id_%@", brand_id]
#define CarBrandThirdDetailCacheWithId(brnad_id, metadata_id) [NSString stringWithFormat:@"brand_id_%@_%@", brand_id, metadata_id]

@interface CGHBaseManager : NSObject

+ (instancetype)shareManager;

/**
 *@brief 保存数据到本地
 *@param string key.
 *@param rootObject 数据.
 */
- (void)saveToLocalWithPathComponent:(NSString *)string withRootObject:(id)rootObject;
/**
 *@brief 取出本地数据
 *@param string key.
 */
- (id)getLocalDataWithpathComponent:(NSString *)string;

/**
 *@brief 删除本地数据
 *@param string key.
 */
- (void)removeLocalDataWithpathComponent:(NSString *)string;

/**
 *@brief 是否有缓存
 *@param key key.
 */
- (BOOL)hasCacheDataWithKey:(NSString *)key;

@end
