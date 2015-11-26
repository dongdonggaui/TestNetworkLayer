//
//  WeiboAuthAPIManager.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "WeiboAuthAPIManager.h"

@implementation WeiboAuthAPIManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
    }
    return self;
}

#pragma mark - RTAPIManager
- (NSString *)methodName
{
    return @"oauth2/authorize";
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
    return YES;
}

@end
