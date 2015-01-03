//
//  YFRGuageViewController.h
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "YFRGetDevices.h"
#import "YFRGetDeviceInfo.h"

@interface YFRGuageViewController : NSViewController <YFRGetDeviceInfoDelegate>

@property (strong) YFRDevice* selectedDevice;

@end
