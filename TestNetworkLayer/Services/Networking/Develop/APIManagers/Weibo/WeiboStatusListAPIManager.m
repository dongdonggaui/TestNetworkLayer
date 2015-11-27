//
//  WeiboStatusListAPIManager.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "WeiboStatusListAPIManager.h"

@implementation WeiboStatusListAPIManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

- (NSString *)methodName
{
    return @"statuses/home_timeline.json";
}

- (NSString *)serviceType
{
    return kAIFSeviceWeibo;
}

- (RTAPIManagerRequestType)requestType
{
    return RTAPIManagerRequestTypeGet;
}

#pragma mark - RTAPIManagerValidator
- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    return YES;
}

- (BOOL)manager:(RTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    if (![data objectForKey:@"access_token"]) {
        return NO;
    }
    return YES;
}

@end
