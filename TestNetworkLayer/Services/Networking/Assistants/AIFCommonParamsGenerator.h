//
//  AXPublicURLParamsGenerator.h
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AIFCommonParamsGenerator <NSObject>

- (NSDictionary *)commonParamsDictionary;
- (NSDictionary *)commonParamsDictionaryForLog;

@end

//@interface AIFCommonParamsGenerator : NSObject
//
//+ (NSDictionary *)commonParamsDictionary;
//+ (NSDictionary *)commonParamsDictionaryForLog;
//
//@end
