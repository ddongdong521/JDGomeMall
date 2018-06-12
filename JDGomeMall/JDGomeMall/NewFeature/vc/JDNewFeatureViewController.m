//
//  JDNewFeatureViewController.m
//  JDGomeMall
//
//  Created by 邓建东 on 2018/6/5.
//  Copyright © 2018年 邓建东. All rights reserved.
//

#import "JDNewFeatureViewController.h"
#import "JDTabBarViewController.h"
#import "JDNewFeatureCell.h"


@interface JDNewFeatureViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


/**
 父视图
 */
@property (strong, nonatomic)UICollectionView *collectionView;

/**
 新特性图片数组
 */
@property (nonatomic, copy)NSArray *imageArray;

/**
 小圆点选中颜色
 */
@property (nonatomic, strong)UIColor *selectedColor;

/**
 跳过按钮
 */
@property (nonatomic, strong)UIButton *skipButton;

/**
 小圆点控件
 */
@property (nonatomic, strong)UIPageControl *pageControl;

/**
 是否显示跳过
 */
@property (nonatomic, assign) BOOL showSkip;

/**
 是否显示小圆点
 */
@property (nonatomic, assign) BOOL showPageCount;

@end
static NSString *const JDNewFeatureCellID = @"JDNewFeatureCell";

@implementation JDNewFeatureViewController

#pragma mark Lazy

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.view insertSubview:_collectionView atIndex:0];
        
        [_collectionView registerClass:[JDNewFeatureCell class] forCellWithReuseIdentifier:JDNewFeatureCellID];
        
    }
    return _collectionView;
}

- (UIButton *)skipButton{
    if (!_skipButton) {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipButton.frame = CGRectMake(ScreenW - 85, 30, 65, 30);
        _skipButton.hidden = YES;
        _skipButton.layer.cornerRadius = 15;
        _skipButton.layer.masksToBounds = 15;
        _skipButton.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.8];
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_skipButton setTitle:@"跳过" forState:0];
        [_skipButton addTarget:self action:@selector(skipButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_skipButton];
    }
    return _skipButton;
}
- (UIPageControl *)pageControl{
    if (!_pageControl && _imageArray.count != 0) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = _imageArray.count;
        _pageControl.userInteractionEnabled = false;
        [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
        UIColor *currColor = (_selectedColor == nil) ? [UIColor darkGrayColor] : _selectedColor;
        
        [_pageControl setCurrentPageIndicatorTintColor: currColor];
        _pageControl.frame = CGRectMake(0, ScreenH * 0.95, ScreenW, 35);
        
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
}

- (void)setupFeatureAttribute:(NSArray *)imageArray showSkip:(BOOL)show selectColor:(UIColor *)seleColor showPageCount:(BOOL)showPageCount{
    self.imageArray = imageArray;
    self.showSkip = show;
    self.selectedColor = seleColor;
    self.showPageCount = showPageCount;
}

- (void)setShowSkip:(BOOL)showSkip{
    _showSkip = showSkip;
    self.skipButton.hidden = !showSkip;
}
- (void)setShowPageCount:(BOOL)showPageCount{
    _showPageCount = showPageCount;
    self.pageControl.hidden = !showPageCount;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = JDBGColor;
    self.collectionView.backgroundColor = JDBGColor;
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW, ScreenH);
}


#pragma mark -----UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JDNewFeatureCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:JDNewFeatureCellID forIndexPath:indexPath];
    cell.nFeatureImageView.image = (JD_isIPhoneX)?[UIImage imageNamed:[NSString stringWithFormat:@"%@_x",self.imageArray[indexPath.row]]] : [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.hideBtnImg = @"hidden";
    [cell dc_GetCurrentPageIndex:indexPath.row lastPageIndex:self.imageArray.count - 1];
    WEAKSELF
    cell.hiddenNewFeatureBlock = ^{
        [weakSelf restoreRootViewController:[JDTabBarViewController alloc]];
    };
    return cell;
}

#pragma mark - 使用代理如果滑倒最后一页继续滑动就切换控制器
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_imageArray.count < 2) {
        return;
    }
    _collectionView.bounces = (scrollView.contentOffset.x > (self.imageArray.count - 2) * ScreenW) ? YES : NO;
    if (scrollView.contentOffset.x) {
        if (scrollView.contentOffset.x >  (_imageArray.count - 1) * ScreenW) {
            [self restoreRootViewController:[[JDTabBarViewController alloc] init]];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (!_showPageCount) {
        return;
    }
    CGPoint current = scrollView.contentOffset;
    NSInteger page = current.x / scrollView.jd_width;
    _pageControl.currentPage = page;
}

- (void)restoreRootViewController:(UIViewController *)vc{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.7 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        [UIView setAnimationsEnabled:oldState];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)skipButtonClick{
    [self restoreRootViewController:[[JDTabBarViewController alloc]init]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
