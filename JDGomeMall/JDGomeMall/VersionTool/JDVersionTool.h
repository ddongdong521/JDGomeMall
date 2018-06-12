//
//  JDVersionTool.h
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/5.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDVersionTool : NSObject


+ (NSString *)jd_GetLastAppVersion;

+ (void)jd_SaveAppVersion:(NSString *)version;
@end
