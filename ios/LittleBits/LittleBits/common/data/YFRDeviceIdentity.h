//
//  YFRDeviceIdentity.h
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFRDeviceIdentity : NSObject


@property NSString* deviceId;
@property NSString* mac;
@property NSString* deviceHash;
@property NSString* firmware_version;
@property NSString* device;
@property NSString* protocol_version;
@property NSString* setup_version;

+ (YFRDeviceIdentity*) parse:(NSDictionary*) response;

@end
