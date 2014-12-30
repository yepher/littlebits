//
//  ViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "ViewController.h"
#import "YFRHttpHelper.h"
#import "YFRGetDevices.h"

@interface ViewController ()

@property (weak) IBOutlet NSSecureTextField *tokenField;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* tokenVal = [[NSUserDefaults standardUserDefaults] valueForKey:@"TOKEN"];
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
    
    [[NSUserDefaults standardUserDefaults] setValue:[sender stringValue] forKey:@"TOKEN"];
}

- (IBAction)onLoadDevices:(id)sender {
    YFRHttpHelper* httpHelper = [YFRHttpHelper new];
    YFRGetDevices* getDevices = [YFRGetDevices new];
    [httpHelper doRequest: getDevices];
}

@end
