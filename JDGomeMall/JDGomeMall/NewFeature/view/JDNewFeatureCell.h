//
//  JDNewFeatureCell.h
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/8.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDNewFeatureCell : UICollectionViewCell


/**
 图片视图
 */
@property (strong,nonatomic)UIImageView *nFeatureImageView;

/**
隐藏新特性回调
 */
@property (nonatomic,copy)dispatch_block_t hiddenNewFeatureBlock;

/**
 跳过图片素材
 */
@property (strong, nonatomic)NSString * hideBtnImg;


/**
 用来获取页码
 
 @param currentIndex 当前index
 @param lastIndex 最后index
 */
- (void)dc_GetCurrentPageIndex:(NSInteger)currentIndex lastPageIndex:(NSInteger)lastIndex;
@end
