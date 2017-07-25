//
//  TodayViewController.m
//  Widget
//
//  Created by kevin on 2017/7/21.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property(nonatomic,strong)NSDictionary *dict;
//@property (weak, nonatomic) IBOutlet UIButton *titlelabel;
//@property (weak, nonatomic) IBOutlet UIImageView *liveImage;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(0, 400);
    //[self getDict];
    // Do any additional setup after loading the view from its nib.
}
//-(void)getDict
//{
//    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.LiveDemoExtension"];
//    self.dict = [shared valueForKey:@"live"];
//    [self.titlelabel setTitle:self.dict[@"myname"] forState:UIControlStateNormal];
//    self.liveImage.image =[UIImage imageWithData:[shared valueForKey:@"imagedate"]];
//
//}
- (IBAction)newlive:(id)sender {
   [ self.extensionContext openURL:[NSURL URLWithString:@"live://"] completionHandler:^(BOOL success) {
        
   }];
}
- (IBAction)showlive:(id)sender {
    
}
- (IBAction)my:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
