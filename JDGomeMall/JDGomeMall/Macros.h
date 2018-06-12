//
//  Macros.pch
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/5.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#ifndef Macros_pch
#define Macros_pch

/**屏幕高度*/
#define ScreenH [UIScreen mainScreen].bounds.size.height
/**屏幕宽度*/
#define ScreenW [UIScreen mainScreen].bounds.size.width
/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

//全局背景色
#define JDBGColor RGB(245,245,245)

#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"

//获取当前版本号
#define BUNDLE_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
//获取当前版本的biuld
#define BIULD_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//获取当前设备的UDID
#define DIV_UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]












//判断设备是否为iphoneX
#define JD_isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)





#endif /* Macros_pch */
