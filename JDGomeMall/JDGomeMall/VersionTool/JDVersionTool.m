//
//  JDVersionTool.m
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/5.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import "JDVersionTool.h"

@implementation JDVersionTool

static NSString *const AppVersion = @"AppVersion";

+ (NSString *)jd_GetLastAppVersion{
    
    return  [[NSUserDefaults standardUserDefaults] stringForKey: AppVersion];
}

+ (void)jd_SaveAppVersion:(NSString *)version{
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:AppVersion];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
