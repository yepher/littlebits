//
//  YFRGetDeviceInfo.m
//  LittleBits
//
//  Created by Chris Wilson on 12/30/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRGetDeviceInfo.h"
#import "YFRConstants.h"
#import "YFRHttpHelper.h"
#import "YFRDevice.h"

/**
 data:{
     "type": "input",
     "timestamp": 1419992581574,
     "from": {
         "user": {
             "id": )))))
         },
         "device": {
             "id": "000000000000",
             "device": "littlebits-module-cloud",
             "setup_version": "1.0.0",
             "protocol_version": "1.1.0",
             "firmware_version": "1.0.140611a",
             "mac": "000000000000",
             "hash": "ABCDEFGHIJKLMNOP",
             "ap": {
                 "ssid": "MyAccessPoint",
                 "mac": "00:00:00:00:00:00",
                 "strength": 74
             }
         },
         "server": {
             "id": "AbCdEfGh"
         }
     },
     "percent": 100,
     "absolute": 1018,
     "name": "amplitude",
     "payload": {
        "percent": 100,
        "absolute": 1018
     }
 }
 **/

@implementation YFRGetDeviceInfo

- (NSString*) requestPath {
    NSAssert(self.device != nil, @"Device must be set before making output request.");
    NSAssert(self.device.deviceId != nil, @"DeviceID cannot be nil.");

    
    return [NSString stringWithFormat:@"/devices/%@/input", self.device.deviceId];
}

//- (NSString*) requestBody {
//    return @"";
//}

- (YFRRequestType) requestType {
    return YFR_REQUEST_TYPE_INTERNAL;
}

// Unused
- (void) handleResponse:(id) response {

    NSLog(@"TODO: parse: %@", response);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s", __FUNCTION__);
    if (self.delegate != nil) {
        [self.delegate onMonitorEndedForDevice:self.device];
    }
}

/**
 Unfortunetly this api does not return valid JSON so we have to sanatize it before parsing
 **/
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // TODO: this is not correct at all. This code should accumulate responses and only parse complete chunks
    
    NSData* dataToParse = data;
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *prefixToRemove = @"data:";
    if ([dataString hasPrefix:prefixToRemove]) {
        NSString *newString = [dataString copy];
        newString = [dataString substringFromIndex:[prefixToRemove length]];
        dataToParse = [newString dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    NSDictionary* response = [YFRHttpHelper getJsonResponse:dataToParse withContentType:nil];
    NSLog(@"Got: %@", response);
    
    if (self.delegate != nil) {
        [self.delegate onDeviceUpdate:response];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%s error=%@", __FUNCTION__, error);
}

- (void) doRequest {
    
    NSMutableURLRequest *request;
    request = [YFRHttpHelper buildRequest:self];
    
    if (request == nil) {
        return;
    }
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

@end
