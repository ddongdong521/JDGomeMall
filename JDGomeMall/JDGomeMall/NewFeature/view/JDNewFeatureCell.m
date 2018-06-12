//
//  JDNewFeatureCell.m
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/8.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import "JDNewFeatureCell.h"
@interface JDNewFeatureCell ()
@property (nonatomic,strong)UIButton *hideButton;
@end

@implementation JDNewFeatureCell

#pragma mark - super
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _nFeatureImageView = [[UIImageView alloc] init];
        [self insertSubview:_nFeatureImageView atIndex:0];
        
    }
    return self;
}

#pragma mark - LazyLoad
- (UIButton *)hideButton
{
    if (!_hideButton) {
        _hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hideButton.adjustsImageWhenHighlighted = false;
        _hideButton.hidden = YES;
        [_hideButton addTarget:self action:@selector(hideButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_hideButton];
        
    }
    return _hideButton;
}

#pragma mark - super
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nFeatureImageView.frame = self.bounds;
}

- (void)setHideBtnImg:(NSString *)hideBtnImg
{
    _hideBtnImg = hideBtnImg;
    if (hideBtnImg.length != 0) {
        [self.hideButton sizeToFit]; //自适应
        
        [self.hideButton setImage:[UIImage imageNamed:hideBtnImg] forState:UIControlStateNormal];
        self.hideButton.center = CGPointMake(ScreenW * 0.5, ScreenH * 0.9);
    }
}

#pragma mark - 获取页码index
- (void)dc_GetCurrentPageIndex:(NSInteger)currentIndex lastPageIndex:(NSInteger)lastIndex
{
    _hideButton.hidden = (currentIndex == lastIndex) ?  NO : YES; //只有当前index和最后index相等时隐藏按钮才显示
}

#pragma mark - 隐藏点击
- (void)hideButtonClick
{
    !_hiddenNewFeatureBlock ? : _hiddenNewFeatureBlock(); //block回调
}
@end
