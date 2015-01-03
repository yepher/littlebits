//
//  YFRHttpHelper.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRHttpHelper.h"
#import "YFRConstants.h"
#import "GCDAsyncSocket.h"
#import "YFRBaseRequest.h"

@interface YFRHttpHelper ()


@end

@implementation YFRHttpHelper


+ (NSMutableURLRequest *)buildRequest:(YFRBaseRequest *)requestObj {
    NSString *requestStr = [NSString stringWithFormat:@"%@%@",[requestObj server], [requestObj requestPath]];
    if (requestStr == nil) {
        NSLog(@"no request URL!");
        return nil;
    }
    
    NSURL *requestUrl = [NSURL URLWithString:requestStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    NSMutableDictionary *headers = [NSMutableDictionary new];
    
    NSString* userToken = [[NSUserDefaults standardUserDefaults] valueForKey:PREF_TOKEN_KEY];
    
    // add standard headers
    if ([requestObj requiresAuth]) {
        NSString* token = [NSString stringWithFormat:@"Bearer %@", userToken];
        [headers setObject:token forKey:HTTP_HEADER_AUTHORIZATION];
    }
    
    [headers setValue:ACCEPT_TYPE_V2 forKey:@"Accept"];
    
    [headers enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
        // add header
        [request setValue:value forHTTPHeaderField:key];
    }];
    
    [request setValue:CONTENT_TYPE_JSON forHTTPHeaderField:CONTENT_TYPE];
    
    if ([requestObj requestType] == YFR_REQUEST_TYPE_POST) {
        NSString *requestData = [requestObj requestBody];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[requestData dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    return request;
}

- (void) doRequest:(YFRBaseRequest*) requestObj {
    
    NSMutableURLRequest *request;
    request = [YFRHttpHelper buildRequest:requestObj];
    
    if (request == nil) {
        return;
    }
    
    NSHTTPURLResponse *response;
    NSError *error = nil;
    
    // send request to server
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSInteger responseCode = [response statusCode];
    if (responseCode == 200) {
    
        // Get JSON result (server sends back JSON response for several non-200 status codes)
        NSString *contentType = [[[response allHeaderFields] valueForKey:CONTENT_TYPE] lowercaseString];
        if ([contentType rangeOfString:@"json"].location != NSNotFound) {
            id jsonResponse = [YFRHttpHelper getJsonResponse:result withContentType:contentType];

            NSLog(@"JsonResponse: %@", jsonResponse);
            [requestObj handleResponse:jsonResponse];
        }
    } else {
        NSLog(@"Failed to make request because: %@", response);
    }
    
}

+ (id)getJsonResponse:(NSData *)jsonData withContentType:(NSString *)contentType {
    id jsonResponse = nil;
    
    if (jsonData != nil && ([contentType hasPrefix:CONTENT_TYPE_JSON] || contentType == nil)) {
        NSError *jsonError = nil;
        jsonResponse = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
        if (jsonError != nil) {
            jsonResponse = nil;
            NSString *receivedJsonString = [NSString stringWithUTF8String:[jsonData bytes]];
            NSLog(@"%s Failed to parse JSON, because %@, json=%@", __FUNCTION__, jsonError, receivedJsonString);
        }
    }
    else if (jsonData != nil) {
        NSLog(@"WARN: API not returning Content-Type: application/json! instead returning: %@", contentType);
        return [self getJsonResponse:jsonData withContentType:nil];
    }
    return jsonResponse;
}

@end
