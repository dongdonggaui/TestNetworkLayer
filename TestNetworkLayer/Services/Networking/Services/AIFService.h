//
//  AXService.h
//  RTNetworking
//
//  Created by casa on 14-5-15.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFCommonParamsGenerator.h"
#import "AIFSignatureGenerator.h"

// 所有AIFService的派生类都要符合这个protocal
@protocol AIFServiceProtocal <NSObject>

@property (nonatomic, readonly) BOOL isOnline;

@property (nonatomic, readonly) NSString *offlineApiBaseUrl;
@property (nonatomic, readonly) NSString *onlineApiBaseUrl;

@property (nonatomic, readonly) NSString *offlineApiVersion;
@property (nonatomic, readonly) NSString *onlineApiVersion;

@property (nonatomic, readonly) NSString *onlinePublicKey;
@property (nonatomic, readonly) NSString *offlinePublicKey;

@property (nonatomic, readonly) NSString *onlinePrivateKey;
@property (nonatomic, readonly) NSString *offlinePrivateKey;

@end

@interface AIFService : NSObject

@property (nonatomic, strong, readonly) NSString *publicKey;
@property (nonatomic, strong, readonly) NSString *privateKey;
@property (nonatomic, strong, readonly) NSString *apiBaseUrl;
@property (nonatomic, strong, readonly) NSString *apiVersion;
@property (nonatomic, strong, readonly) NSDictionary *commonParamsDictionary;

@property (nonatomic, weak) id<AIFServiceProtocal> child;
@property (nonatomic, weak) id<AIFCommonParamsGenerator> commonParamsGenerator;
@property (nonatomic, weak) id<AIFSignatureGenerator> signatureGenerator;

@end
