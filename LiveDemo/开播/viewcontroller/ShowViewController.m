//
//  ShowViewController.m
//  LiveDemo
//
//  Created by kevin on 2017/6/27.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import "ShowViewController.h"
#import <LFLiveKit.h>

@interface ShowViewController ()<LFLiveSessionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *liveBtn;
@property (weak, nonatomic) IBOutlet UIButton *beautifulBtn;
@property(nonatomic,weak)UIView *livingPreView;

@property (nonatomic, strong) LFLiveSession *session;
@end

@implementation ShowViewController

- (UIView *)livingPreView
{
    if (!_livingPreView) {
        UIView *livingPreView = [[UIView alloc] initWithFrame:self.view.bounds];
        livingPreView.backgroundColor = [UIColor clearColor];
        livingPreView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view insertSubview:livingPreView atIndex:0];
        _livingPreView = livingPreView;
    }
    return _livingPreView;
}
- (LFLiveSession*)session{
    if(!_session){
        /***   默认分辨率368 ＊ 640  音频：44.1 iphone6以上48  双声道  方向竖屏 ***/
        _session = [[LFLiveSession alloc]initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration]  videoConfiguration:[LFLiveVideoConfiguration defaultConfigurationForQuality:LFLiveVideoQuality_Medium2]];
        // 设置代理
        _session.delegate = self;
        _session.running = YES;
        _session.preView = self.livingPreView;
    }
    return _session;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setup];
    
    
  
}
-(void)setup
{
    self.navigationController.navigationBar.hidden = YES;
   self.session.captureDevicePosition = AVCaptureDevicePositionBack;


}
- (IBAction)switch:(id)sender {
    
    AVCaptureDevicePosition devicePositon = self.session.captureDevicePosition;
    self.session.captureDevicePosition = (devicePositon == AVCaptureDevicePositionBack) ? AVCaptureDevicePositionFront : AVCaptureDevicePositionBack;
}
- (IBAction)beauty:(id)sender {
    self.session.beautyFace = !self.session.beautyFace;
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.beautifulBtn setImage:[UIImage imageNamed:@"beautyOFF"] forState:UIControlStateSelected];
        
        
    }else{
        [self.beautifulBtn setImage:[UIImage imageNamed:@"beautyON"] forState:UIControlStateNormal];
    }
}
- (IBAction)close:(id)sender {
    
    if (self.session.state == LFLivePending || self.session.state == LFLiveStart){
        [self.session stopLive];
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)play:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected) { // 开始直播
       
        [self.liveBtn setImage:[UIImage imageNamed:@"Stop"] forState:UIControlStateNormal];
        LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
        
        stream.url = @"rtmp://123.207.39.118/live/stream";
        [self.session startLive:stream];
    }else{ // 结束直播
         [self.liveBtn setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateSelected];
        [self.session stopLive];
     
    }
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
