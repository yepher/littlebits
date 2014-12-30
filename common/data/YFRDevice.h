//
//  YFRDevice.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YFRAccessPoint;

@interface YFRDevice : NSObject

@property NSString* deviceId;
@property NSString* label;
@property NSString* userId;
@property BOOL isConnected;

@property YFRAccessPoint* accessPoint;

@property NSArray* subscriptions;
@property NSArray* subscribers;


@end
