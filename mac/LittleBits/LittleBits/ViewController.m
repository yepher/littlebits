//
//  ViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 12/29/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak) IBOutlet NSSecureTextField *tokenField;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* tokenVal = [[NSUserDefaults standardUserDefaults] valueForKey:@"TOKEN"];

    [self.tokenField setStringValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"TOKEN"]];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onToken:(id)sender {
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, [sender stringValue]);
    
    [[NSUserDefaults standardUserDefaults] setValue:[sender stringValue] forKey:@"TOKEN"];
}

@end
