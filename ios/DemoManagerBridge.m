//
//  CalendarManagerBridge.m
//  SwiftBrigde
//
//  Created by Tiago Missão on 28/11/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@interface RCT_EXTERN_MODULE(DemoManager, NSObject)

RCT_EXTERN_METHOD(log:(NSString *)message time:(nonnull NSNumber *)time)
RCT_EXTERN_METHOD(random:(nonnull NSNumber *) max callback: (RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(isEven:(nonnull NSNumber *)number success:(RCTResponseSenderBlock)success failure:(RCTResponseSenderBlock)failure)
RCT_EXTERN_METHOD(countdown:(nonnull NSNumber*) start)
RCT_EXTERN_METHOD(getLastRandomNumber:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
