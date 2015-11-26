//
//  LHShopNetworkService.m
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import "LHShopNetworkService.h"

@implementation LHShopNetworkService

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://maps.googleapis.com/maps/api/";
}

- (NSString *)onlineApiVersion
{
    return @"directions/json";
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
