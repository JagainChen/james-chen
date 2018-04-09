//
//  CGHBaseManager.m
//  惠多多
//
//  Created by Jagain on 17/3/10.
//  Copyright © 2017年 Jagain. All rights reserved.
//

#import "CGHBaseManager.h"

@implementation CGHBaseManager

+ (instancetype)shareManager{
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    
    return instance;
}

- (void)removeLocalDataWithpathComponent:(NSString *)string{
    EGOCache *cache = [EGOCache globalCache];
    [cache removeCacheForKey:string];
//    NSString *dictionaryPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:string];
//    [NSKeyedUnarchiver unarchiveObjectWithFile:dictionaryPath];
}

- (void)saveToLocalWithPathComponent:(NSString *)string withRootObject:(id)rootObject{
    EGOCache *cache = [EGOCache globalCache];
    [cache setData:[NSKeyedArchiver archivedDataWithRootObject:rootObject] forKey:string];
//    NSString *dictionaryPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:string];
//    [NSKeyedArchiver archiveRootObject:rootObject toFile:dictionaryPath];
}

- (id)getLocalDataWithpathComponent:(NSString *)string {
//    NSString *dictionaryPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:string];
//    NSFileManager *file = [NSFileManager defaultManager];
//
//    if ([file fileExistsAtPath:dictionaryPath]) {
//
//        return [NSKeyedUnarchiver unarchiveObjectWithFile:dictionaryPath];
//    }else{
//
//        return nil;
//    }
    EGOCache *cache = [EGOCache globalCache];
    NSData *data = [cache dataForKey:string];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

- (BOOL)hasCacheDataWithKey:(NSString *)key{
    EGOCache *cacha = [EGOCache globalCache];
    return [cacha hasCacheForKey:key];
}

@end
