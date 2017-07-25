//
//  HomeViewController.m
//  LiveDemo
//
//  Created by kevin on 2017/6/23.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import "HomeViewController.h"
#import "FanModel.h"
#import "HomeVideoCollectionViewCell.h"
#import "PlayViewController.h"
#import "RTRootNavigationController.h"
#import <SDWebImageManager.h>
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define kCollectionViewVideoCellIdentifier @"kHomepageVideoCellIdentifier"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) UICollectionView *videoCollectionView;//热拍
@property (nonatomic, strong) NSMutableArray* DataAry;
@property(nonatomic,strong)NSData *imagedate;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直播列表";
    [FanModel getFanModelithBlock:^(NSMutableArray *dateAry) {
        NSLog(@"%@",dateAry);
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    UICollectionViewFlowLayout* videoFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [videoFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//垂直滚动
    UICollectionView *videocollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,ScreenHeight ) collectionViewLayout:videoFlowLayout];
    videocollectionView.alwaysBounceVertical = YES;//当不够一屏的话也能滑动
    videocollectionView.delegate = self;
    videocollectionView.dataSource = self;
    [videocollectionView setBackgroundColor:[UIColor whiteColor]];
    [videocollectionView registerClass:[HomeVideoCollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewVideoCellIdentifier];
    self.videoCollectionView = videocollectionView;
    [self.view addSubview:self.videoCollectionView];
 
    [FanModel getFanModelithBlock:^(NSMutableArray *Arr) {
       self.DataAry = Arr;
        [self shareDateToWidget];
       [self.videoCollectionView reloadData];
        
    } error:^(NSError *error) {
        
    }];
    self.hidesBottomBarWhenPushed = YES;

    
    // Do any additional setup after loading the view.
}
-(void)shareDateToWidget
{
   NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.LiveDemoExtension"];
    FanModelDetail * fan = self.DataAry[0];
    NSDictionary *dect = [fan toDictionary];
    [sharedDefaults setObject:dect forKey:@"live"];
    [sharedDefaults synchronize];
    
    [[SDWebImageManager sharedManager]loadImageWithURL:[NSURL URLWithString:fan.bigpic]options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        NSLog(@"%ld",receivedSize/expectedSize);
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        self.imagedate = data;
        [sharedDefaults setObject:dect forKey:@"imagedate"];
        [sharedDefaults synchronize];
        
    }];
  
    
    
}
#pragma mark UICollectionViewDataSource {
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.DataAry.count;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = kCollectionViewVideoCellIdentifier;
    HomeVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier1 forIndexPath:indexPath];
    cell.model = [_DataAry objectAtIndex:indexPath.row];
    
    return cell;
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//
//}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
//定义每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth/2 - 2, (ScreenWidth/2 - 2)*1.6);
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0.0,2.0,0.0,2.0);
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
    
}
//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0.0f;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed = YES;
    PlayViewController* cor = [[PlayViewController alloc] init];
    cor.hidesBottomBarWhenPushed = YES;
    cor.datel = self.DataAry[indexPath.row];
    [self.rt_navigationController pushViewController:cor animated:YES complete:^(BOOL finished) {
        
    }];
    self.hidesBottomBarWhenPushed = NO;
 
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
