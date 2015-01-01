//
//  YFRGetDeviceInfo.h
//  LittleBits
//
//  Created by Chris Wilson on 12/30/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFRBaseRequest.h"

@class YFRDevice;

@protocol YFRGetDeviceInfoDelegate <NSObject>

- (void) onDeviceUpdate:(NSDictionary*) deviceInfo;

- (void) onMontorEndedForDevice:(YFRDevice*) device;

@end

@interface YFRGetDeviceInfo : YFRBaseRequest <NSURLConnectionDataDelegate>

@property YFRDevice* device;
@property (weak) id <YFRGetDeviceInfoDelegate> delegate;

- (void) doRequest;
@end
