//
//  YFRDevice.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRDevice.h"
#import "YFRAccessPoint.h"

/**
 Example Device:
 {
    "id": "000000000000",
    "label": "MyDevice",
    "user_id": 00000,
    "is_connected": true,
    "ap": {
        "ssid": "MySSID",
        "mac": "00:00:00:00:00:00",
        "strength": "86",
        "server_id": "AbCdEfG",
        "socket_id": "AbCdEfG"
    },
    "subscriptions": [
 
    ],
    "subscribers": [
 
    ]
 }
 **/

@implementation YFRDevice


+ (YFRDevice*) parse:(NSDictionary*) response {
    YFRDevice* device = [YFRDevice new];
    
    device.deviceId = [response objectForKey:@"id"];
    device.label = [response objectForKey:@"label"];
    device.userId = [response objectForKey:@"user_id"];
    device.isConnected = [[response objectForKey:@"is_connected"] boolValue];
    device.subscriptions = [response objectForKey:@"subscriptions"];
    device.subscribers = [response objectForKey:@"subscribers"];
    
    id apDict = [response objectForKey:@"ap"];
    if ([NSNull null] != apDict ) {
        YFRAccessPoint* accessPoint = [YFRAccessPoint parse:apDict];
        device.accessPoint = accessPoint;
    }
    
    return device;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"id:%@, label:%@, userId:%@, ap:[%@]", self.deviceId, self.label, self.userId, self.accessPoint];
}


@end
