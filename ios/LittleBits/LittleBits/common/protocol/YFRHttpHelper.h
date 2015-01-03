//
//  YFRHttpHelper.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YFRBaseRequest;

@interface YFRHttpHelper : NSObject

- (void) doRequest:(YFRBaseRequest*) request;

+ (NSMutableURLRequest *)buildRequest:(YFRBaseRequest *)requestObj;
+ (id)getJsonResponse:(NSData *)jsonData withContentType:(NSString *)contentType;

@end
