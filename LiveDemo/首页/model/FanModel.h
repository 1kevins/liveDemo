//
//  FanModel.h
//  LiveDemo
//
//  Created by kevin on 2017/6/23.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol FanModelDetail @end
@interface FanModelDetail  : JSONModel
/*
 
 "pos": 1,
 "useridx": 61563790,
 "userId": "WeiXin31735821",
 "gender": 0,
 "myname": "添蓝💥陆骚骚👙",
 "smallpic": "http://liveimg.9158.com/pic/avator/2017-06/26/02/20170626023732_61563790_250.png",
 "bigpic": "http://liveimg.9158.com/pic/avator/2017-06/26/02/20170626023732_61563790_640.png",
 "allnum": 5168,
 "roomid": 66917861,
 "serverid": 6,
 "gps": "营口市",
 "flv": "http://hdl.9158.com/live/1d2d32598d593fab150d29188263cfad.flv",
 "anchorlevel": 0,
 "starlevel": 5,
 "familyName": "",
 "isSign": 0,
 "nation": "",
 "nationFlag": "",
 "distance": 0
 */
@property(nonatomic,assign)NSInteger pos  ;// 3,
@property(nonatomic,assign)NSInteger useridx  ;// 62132191,
@property(nonatomic,strong)NSString * userId  ;//  WeiXin22369830 ,
@property(nonatomic,assign)NSInteger gender  ;// 0,
@property(nonatomic,strong)NSString * myname  ;//  秋-小曲贼上道😏 ,
@property(nonatomic,strong)NSString * smallpic  ;//  http ;////liveimg.9158.com/pic/avator/2017-05/07/20/20170507204801_62132191_250.png ,
@property(nonatomic,strong)NSString * bigpic  ;//  http ;////liveimg.9158.com/pic/avator/2017-05/07/20/20170507204801_62132191_640.png ,
@property(nonatomic,assign)NSInteger allnum  ;// 25545,
@property(nonatomic,assign)NSInteger roomid  ;// 60314136,
@property(nonatomic,assign)NSInteger serverid  ;// 15,
@property(nonatomic,strong)NSString * gps  ;//
@property(nonatomic,strong)NSString * flv  ;//  http ;////hdl.9158.com/live/e88fabcfba2926c99eb6500eb513fc92.flv ,
@property(nonatomic,assign)NSInteger  anchorlevel;
@property(nonatomic,assign)NSInteger starlevel  ;// 2,
@property(nonatomic,strong)NSString * familyName  ;//   ,
@property(nonatomic,assign)NSInteger isSign  ;// 0,
@property(nonatomic,strong)NSString * nation  ;//   ,
@property(nonatomic,strong)NSString * nationFlag  ;//   ,
@property(nonatomic,assign)NSInteger distance  ;// 0,








@end


@protocol FanModelList @end
@interface FanModelList  : JSONModel

@property(nonatomic,assign)NSInteger counts;
@property(nonatomic,strong)NSMutableArray <FanModelDetail>* list;

@end


@interface FanModel  : JSONModel

@property(nonatomic,strong)NSString *code;
@property(nonatomic,strong)NSString *msg;
@property(nonatomic,strong)FanModelList <FanModelList>*data;
+(void)getFanModelithBlock:(void (^)(NSMutableArray* Arr))success error:(void (^)(NSError* error)) errors;
@end



