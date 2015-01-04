//
//  YFRGuageViewController.h
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFRGetDevices.h"
#import "YFRGetDeviceInfo.h"


@class YFRDevice;

@interface YFRGuageViewController : UIViewController <YFRGetDeviceInfoDelegate>

@property (strong, nonatomic) YFRDevice* selectedDevice;

@end
