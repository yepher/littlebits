//
//  ViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "ViewController.h"
#import "YFRConstants.h"
#import "YFRHttpHelper.h"
#import "YFRGetDevices.h"
#import "YFRDevice.h"
#import "YFRAccessPoint.h"
#import "YFROutputRequest.h"
#import "YFRGetDeviceInfo.h"

@interface ViewController ()

@property (weak) IBOutlet NSSecureTextField *tokenField;
@property (weak) IBOutlet NSOutlineView *deviceListView;

@property (weak) IBOutlet NSSlider *cloudSliderInput;
@property (weak) IBOutlet NSButton *cloudButtonInput;
@property (weak) IBOutlet NSLevelIndicator *cloudLevelOutput;

@property NSArray* devices;

@property YFRDevice* selectedDevice;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.devices = [NSArray array];
    
    NSString* tokenVal = [[NSUserDefaults standardUserDefaults] valueForKey:PREF_TOKEN_KEY];
    if (tokenVal != nil && tokenVal.length > 0) {
        [self.tokenField setStringValue:tokenVal];
    }
    
    [self updateControls];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onToken:(id)sender {
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, [sender stringValue]);
    
    [[NSUserDefaults standardUserDefaults] setValue:[sender stringValue] forKey:PREF_TOKEN_KEY];
}

- (IBAction)onLoadDevices:(id)sender {
    YFRHttpHelper* httpHelper = [YFRHttpHelper new];
    YFRGetDevices* request = [YFRGetDevices new];
    [request setDelegate:self];
    [httpHelper doRequest: request];
}

- (void) onDevices:(NSArray *)devices {
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, devices);
    self.devices = devices;
    [self.deviceListView reloadData];
    
}

- (void) onDeviceUpdate:(NSDictionary *)deviceInfo {
    NSNumber* value = [deviceInfo valueForKey:@"percent"];
    [self.cloudLevelOutput setIntegerValue:[value integerValue]];
}

#pragma mark - Cloud Bit Controls

- (void) updateControls {
    BOOL state = (self.selectedDevice != nil);
    [self.cloudButtonInput setEnabled:state];
    [self.cloudSliderInput setEnabled:state];
    [self.cloudLevelOutput setEnabled:state];
}

- (IBAction)onSliderInput:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (self.selectedDevice == nil) {
        return;
    }
    
    YFROutputRequest* request = [YFROutputRequest new];
    request.level = self.cloudSliderInput.integerValue;
    request.duration = -1;
    request.device = self.selectedDevice;
    
    YFRHttpHelper* httpHelper = [YFRHttpHelper new];
    [httpHelper doRequest: request];
    
}

- (IBAction)onButtonInput:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if (self.selectedDevice == nil) {
        return;
    }
    
    YFROutputRequest* request = [YFROutputRequest new];
    request.level = 99;
    request.duration = 1000;
    request.device = self.selectedDevice;
    
    YFRHttpHelper* httpHelper = [YFRHttpHelper new];
    [httpHelper doRequest: request];
}

- (IBAction)monitorDevice:(id)sender {
    YFRGetDeviceInfo* request = [YFRGetDeviceInfo new];
    request.device = self.selectedDevice;
    request.delegate = self;
    [request doRequest];
}

#pragma mark - NSOutlineView Delegates

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    
    if (item == nil) {
        
        return [self.devices count];
    } else {
        return 0;
    }
}


- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if (item == nil) {
        return YES;
    } else {
        return NO;
    }
}


- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    NSLog(@"Index: %@", @(index));
    return self.devices[index];
}


- (id)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    NSTableCellView *result;
    if ([[tableColumn identifier] isEqualToString:@"HeaderCell"]) {
        result = [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
    } else {
        result = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
    }
    YFRDevice* device = item;
    [[result textField] setStringValue:[NSString stringWithFormat:@"%@ (sig=%@)", device.label, device.accessPoint.strength]];
    [result setToolTip:[device deviceId]];
    
   
    if (device.isConnected) {
         [[result imageView] setImage:[NSImage imageNamed:@"connected"]];
    } else {
         [[result imageView] setImage:[NSImage imageNamed:@"disconnected"]];
    }
    
    return result;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item {
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, item);
    self.selectedDevice = item;
    [self updateControls];
    
    return YES;
}


@end
