//
//  YFRBaseRequest.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YFRRequestType) {
    YFR_REQUEST_TYPE_GET,
    YFR_REQUEST_TYPE_PUT,
    YFR_REQUEST_TYPE_POST,
    YFR_REQUEST_TYPE_DELETE,
     YFR_REQUEST_TYPE_INTERNAL,
};

@interface YFRBaseRequest : NSObject

- (NSString*) requestPath;
- (NSString*) requestBody;
- (YFRRequestType) requestType;

- (void) handleResponse:(id) response;
- (NSString*) server;
- (BOOL) requiresAuth;

@end
