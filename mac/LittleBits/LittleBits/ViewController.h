//
//  ViewController.h
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "YFRGetDevices.h"
#import "YFRGetDeviceInfo.h"

@interface ViewController : NSViewController <NSOutlineViewDataSource, NSOutlineViewDelegate, YFRGetDeviceDelegate, YFRGetDeviceInfoDelegate>


@end

