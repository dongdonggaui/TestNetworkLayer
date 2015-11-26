//
//  AIFServiceWeibo.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "AIFServiceWeibo.h"
#import "NSDictionary+AXNetworkingMethods.h"

@implementation AIFServiceWeibo

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"https://api.weibo.com";
}

- (NSString *)onlineApiVersion
{
    return @"";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

- (NSString *)offlineApiVersion
{
    return self.onlineApiVersion;
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.onlinePublicKey;
}

@end

@implementation WeiboSignatureGenerator

- (NSString *)signatureWithParams:(NSDictionary *)params
{
    return nil;
}

@end
