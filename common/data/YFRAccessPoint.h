//
//  YFRAccessPoint.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFRAccessPoint : NSObject

@property NSString* ssid;
@property NSString* mac;
@property NSString* strength;
@property NSString* serverId;
@property NSString* socketId;

@end
