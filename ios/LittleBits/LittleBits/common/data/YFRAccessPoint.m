//
//  YFRAccessPoint.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRAccessPoint.h"

@implementation YFRAccessPoint


/**
 "ap": {
     "ssid": "MySSID",
     "mac": "00:00:00:00:00:00",
     "strength": "86",
     "server_id": "AbCdEfG",
     "socket_id": "AbCdEfG"
 }
 **/
+ (YFRAccessPoint*) parse:(NSDictionary*) response {
    YFRAccessPoint* accessPoint = [YFRAccessPoint new];
    
    accessPoint.ssid = [response objectForKey:@"ssid"];
    accessPoint.mac = [response objectForKey:@"mac"];
    accessPoint.strength = [response objectForKey:@"strength"];
    accessPoint.serverId = [response objectForKey:@"server_id"];
    accessPoint.socketId = [response objectForKey:@"socket_id"];
    
    return accessPoint;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"ssid:%@, mac:%@, strength:%@", self.ssid, self.mac, self.strength];
}

@end
