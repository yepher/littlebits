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

@interface ViewController ()

@property (weak) IBOutlet NSSecureTextField *tokenField;
@property (weak) IBOutlet NSOutlineView *deviceListView;

@property NSArray* devices;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.devices = [NSArray array];
    
    NSString* tokenVal = [[NSUserDefaults standardUserDefaults] valueForKey:PREF_TOKEN_KEY];
    if (tokenVal != nil && tokenVal.length > 0) {
        [self.tokenField setStringValue:tokenVal];
    }
    
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
    YFRGetDevices* getDevices = [YFRGetDevices new];
    [getDevices setDelegate:self];
    [httpHelper doRequest: getDevices];
}

- (void) onDevices:(NSArray *)devices {
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, devices);
    self.devices = devices;
    [self.deviceListView reloadData];
    
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
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

@end
