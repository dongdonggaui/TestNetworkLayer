//
//  AIFGeneralCommonParamsGenerator.h
//  TestNetworkLayer
//
//  Created by huangluyang on 15/11/26.
//  Copyright © 2015年 huangluyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFCommonParamsGenerator.h"

@interface AIFGeneralCommonParamsGenerator : NSObject <AIFCommonParamsGenerator>

- (NSDictionary *)commonParamsDictionary;
- (NSDictionary *)commonParamsDictionaryForLog;

@end
