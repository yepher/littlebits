//
//  YFRIdentifyDevice.m
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRIdentifyDevice.h"
#import "YFRConstants.h"
#import "YFRDeviceIdentity.h"

@implementation YFRIdentifyDevice

- (NSString*) requestPath {
    return @"/identify/";
}

//- (NSString*) requestBody {
//    return @"";
//}

- (void)fetchSymbols: (YFRIdentifyDeviceRequestCompleteBlock)callback {
    
}

- (YFRRequestType) requestType {
    return YFR_REQUEST_TYPE_GET;
}

- (void) handleResponse:(id) response {
    
    //YFRDeviceIdentity* identity = [YFRDeviceIdentity parse:response];
}



- (NSString*) server {
    return CLOUD_BIT_URL;
}

- (BOOL) requiresAuth {
    return NO;
}

@end
