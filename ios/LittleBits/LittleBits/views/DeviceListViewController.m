//
//  DeviceListViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import "DeviceListViewController.h"
#import "YFRTokenEntryViewController.h"
#import "YFRGuageViewController.h"
#import "YFRDeviceTableViewCell.h"
#import "YFRDevice.h"
#import "YFRHttpHelper.h"
#import "YFRConstants.h"



@interface DeviceListViewController ()

@property NSArray* devices;

@property YFRDevice* selectedDevice;

@end

@implementation DeviceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.devices = [NSArray array];
}

- (void) viewWillAppear:(BOOL)animated {
    NSString* userToken = [[NSUserDefaults standardUserDefaults] valueForKey:PREF_TOKEN_KEY];
    if (userToken == nil || userToken.length == 0) {
        NSLog(@"Needs token.");
        // Prompt user to enter token
        YFRTokenEntryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"tokenEntryViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    } else {
        YFRHttpHelper* httpHelper = [YFRHttpHelper new];
        YFRGetDevices* request = [YFRGetDevices new];
        [request setDelegate:self];
        [httpHelper doRequest: request];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableView delegates

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.devices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YFRDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deviceListCell"];
 
    YFRDevice* device = self.devices[indexPath.row];
    if (device.isConnected) {
        [cell.deviceStateImageView setImage:[UIImage imageNamed:@"connected"]];
    } else {
        [cell.deviceStateImageView setImage:[UIImage imageNamed:@"disconnected"]];
    }
    
    [cell.deviceLabel setText:[device label]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    YFRDevice* device = self.devices[indexPath.row];
    
    YFRGuageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"guageViewController"];
    [vc setDevice:device];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark - YFRGetDevice* deleages

- (void) onDevices:(NSArray*) devices {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.devices = devices;
    [self.tableView reloadData];
    
}

- (void) onDeviceUpdate:(NSDictionary*) deviceInfo {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) onMonitorEndedForDevice:(YFRDevice*) device {
     NSLog(@"%s", __PRETTY_FUNCTION__);
}


@end
