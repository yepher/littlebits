//
//  DeviceListViewController.h
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFRGetDevices.h"
#import "YFRGetDeviceInfo.h"

@interface DeviceListViewController : UIViewController < UITableViewDataSource, UITableViewDelegate, YFRGetDeviceDelegate, YFRGetDeviceInfoDelegate>

@property (weak, nonatomic) IBOutlet UITableView* tableView;

@end
