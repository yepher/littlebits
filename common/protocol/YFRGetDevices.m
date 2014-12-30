//
//  YFRGetDevices.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRGetDevices.h"

@implementation YFRGetDevices

- (NSString*) requestPath {
    return @"/devices";
}

//- (NSString*) requestBody {
//    return @"";
//}

- (YFRRequestType) requestType {
    return YFR_REQUEST_TYPE_GET;
}
@end
