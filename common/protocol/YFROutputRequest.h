//
//  YFROutputRequest.h
//  LittleBits
//
//  Created by Chris Wilson on 12/30/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFRBaseRequest.h"

@class YFRDevice;
@interface YFROutputRequest : YFRBaseRequest

@property YFRDevice* device;

@property NSInteger duration;
@property NSInteger level;

@end
