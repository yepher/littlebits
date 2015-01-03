//
//  YFRGetDevices.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFRBaseRequest.h"

@protocol YFRGetDeviceDelegate <NSObject>

- (void) onDevices:(NSArray*) devices;

@end

@interface YFRGetDevices : YFRBaseRequest

@property (weak) id <YFRGetDeviceDelegate> delegate;

@end
