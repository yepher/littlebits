//
//  YFROutputRequest.m
//  LittleBits
//
//  Created by Chris Wilson on 12/30/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

/**
 ? percent
 | <Int:Range:0-100>       –––– a percent of the maximum current output
 – default: 100
 
 ? duration_ms:
 | <Int>                   –––– output will be sustained for given milliseconds
 – if the duration_ms is `-1` it will last forever or until another output is received by device
 - maximum value: 32000
 - default: 3000 (3 seconds)
 **/

#import "YFROutputRequest.h"
#import "YFRDevice.h"

@implementation YFROutputRequest


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.duration = 3000;
    }
    return self;
}

- (NSString*) requestPath {
    NSAssert(self.device != nil, @"Device must be set before making output request.");
    NSAssert(self.device.deviceId != nil, @"DeviceID cannot be nil.");
    
    return [NSString stringWithFormat:@"/devices/%@/output", self.device.deviceId];
}

- (NSString*) requestBody {
    NSInteger level = 99;
    NSInteger duration = 3000;
    
    if (self.level >= 0 && self.level <= 100) {
        level = self.level;
    }
    
    if (self.duration == -1 || (self.duration >= 0 && self.duration <= 32000)) {
        duration = self.duration;
    }
    
    // {\"percent\":%@, \"duration_ms\":%@}
    //return [NSString stringWithFormat:@"percent=%@&duration_ms=%@", @(level), @(duration)];
    
    NSString* request = [NSString stringWithFormat:@"{\"percent\":%@, \"duration_ms\":%@}", @(level), @(duration)];
    NSLog(@"> %@", request);
    return request;
}

- (YFRRequestType) requestType {
    return YFR_REQUEST_TYPE_POST;
}

- (void) handleResponse:(id) response {
    NSLog(@"response: %@", response);
}



@end
