//
//  RootTabBarController.m
//  LiveDemo
//
//  Created by kevin on 2017/6/23.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import "RootsTabBarController.h"
#import <RTRootNavigationController.h>
#import "HomeViewController.h"
#import "ShowViewController.h"
#import "PersonalViewController.h"
@interface RootsTabBarController ()

@end

@implementation RootsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetUi];
  
    // Do any additional setup after loading the view.
}
-(void)SetUi{
    
    
    RTRootNavigationController *homeNav = [[RTRootNavigationController alloc] initWithRootViewController:HomeViewController.new];
    
    //    PushStremViewController *Push =[[PushStremViewController alloc]init];
    
    UINavigationController *showNav =[[UINavigationController alloc]initWithRootViewController:ShowViewController.new];
    
    
    //    MeViewController *Mine =[[MeViewController alloc]init];
    
    RTRootNavigationController *perNav =[[RTRootNavigationController alloc]initWithRootViewController:PersonalViewController.new];
    
    self.viewControllers = @[homeNav,showNav,perNav];
    
    NSArray *array = self.viewControllers;
    
    NSArray *SimagesArray = @[@"tab_live_p", @"tab_room_p", @"tab_me_p"];
    
    
    NSArray *imagesArray = @[@"tab_live", @"tab_room", @"tab_me"];
    
    for (int i = 0; i < array.count ; i++) {
        
        UIViewController *vc= array[i];
        
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:imagesArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: SimagesArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    }
    
    UIButton* centerBtn = [[UIButton alloc] init];
    [centerBtn addTarget:self action:@selector(clickCenterBtn) forControlEvents:UIControlEventTouchUpInside];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    centerBtn.frame = CGRectMake(screenWidth/2 -30 , 0, 60, 60);
    [self.tabBar addSubview:centerBtn];
    
    
    
}
- (void)clickCenterBtn{
    NSLog(@"clickCenterBtn");
    UINavigationController *MineNav =[[UINavigationController alloc]initWithRootViewController:ShowViewController.new];
    [self.selectedViewController presentViewController:MineNav animated:NO completion:^{
        
    }];
}



- (void)setupTabBarBackgroundImage {
    
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    UIImage *image = [UIImage imageNamed:@"tab_bg"];
    
    CGFloat top = 40; // 顶端盖高度
    CGFloat bottom = 40 ; // 底端盖高度
    CGFloat left = 100; // 左端盖宽度
    CGFloat right = 100; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    
    // 指定为拉伸模式，伸缩后重新赋值
    UIImage *TabBgImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    self.tabBar.backgroundImage = TabBgImage;
    self.tabBar.shadowImage = [UIImage new];
    
    [self.tabBar setClipsToBounds:YES];
    
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
