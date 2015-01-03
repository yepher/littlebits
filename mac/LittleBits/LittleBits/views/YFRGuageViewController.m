//
//  YFRGuageViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import "YFRGuageViewController.h"
#import "YFRRobotArmView.h"

@interface YFRGuageViewController ()

@end

@implementation YFRGuageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)onDoneButton:(id)sender {
    [self dismissController:self];
}

- (void) dismissController:(id)sender {
    [super dismissController:sender];
}

@end
