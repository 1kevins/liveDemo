//
//  FanModel.m
//  LiveDemo
//
//  Created by kevin on 2017/6/23.
//  Copyright © 2017年 SLLive. All rights reserved.
//

#import "FanModel.h"
#import <AFNetworking.h>

@implementation FanModel
+(void)getFanModelithBlock:(void (^)(NSMutableArray *))success error:(void (^)(NSError *))errors
{
    NSString *apiString = @"http://live.9158.com/Fans/GetHotLive?page=1";
    
    AFHTTPSessionManager* afManager = [AFHTTPSessionManager manager];
    
    afManager.responseSerializer.acceptableContentTypes
    = [NSSet setWithObject:@"text/html"];
    
    afManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    afManager.requestSerializer.timeoutInterval = 30;
    
    [afManager GET:apiString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"status_code"] intValue] != 0){
            return ;
        }else
        {
            NSError *ModelError;
            FanModel *model =[[FanModel alloc]initWithDictionary:responseObject error:&ModelError];
            if (ModelError) {
                NSLog(@"error:%@",ModelError);
            }
            if (success) {
                success(model.data.list);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errors) {
            errors(error);
        }
        
    }];



}
@end
@implementation FanModelList



@end
@implementation FanModelDetail



@end
