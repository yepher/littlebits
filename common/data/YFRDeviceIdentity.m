//
//  YFRDeviceIdentity.m
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRDeviceIdentity.h"

@implementation YFRDeviceIdentity

/**
 {
     "id":"000000000000",
     "mac":"000000000000",
     "hash":"ABCDEF012345677889",
     "firmware_version":"1.0.140611a",
     "device":"littlebits-module-cloud",
     "protocol_version":"1.1.0",
     "setup_version":"1.0.0"
 }
 **/
+ (YFRDeviceIdentity*) parse:(NSDictionary*) response {
    YFRDeviceIdentity* identity = [YFRDeviceIdentity new];
    
    identity.deviceId = [response objectForKey:@"id"];
    identity.mac = [response objectForKey:@"mac"];
    identity.deviceHash = [response objectForKey:@"hash"];
    identity.firmware_version = [response objectForKey:@"firmware_version"];
    identity.device = [response objectForKey:@"device"];
    identity.protocol_version = [response objectForKey:@"protocol_version"];
    identity.setup_version = [response objectForKey:@"setup_version"];
    
    return identity;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"device: %@, id: %@, hash: %@, ", self.device, self.deviceId, self.deviceHash];
}

@end
