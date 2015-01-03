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

@property (weak) IBOutlet YFRRobotArmView *robotArmView;

@property BOOL isMonitoringDevice;

@end

@implementation YFRGuageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isMonitoringDevice = NO;
}

- (void) viewDidAppear {
    [self monitorDevice:self.selectedDevice];
}

- (IBAction)onDoneButton:(id)sender {
    [self dismissController:self];
}

- (void) dismissController:(id)sender {
    [super dismissController:sender];
    
    // TODO: stop device monitor
}

- (void) monitorDevice:(id)sender {
    if (self.isMonitoringDevice) {
        NSLog(@"Ingore monitor since monitor is already running.");
        return;
    }
    
    self.isMonitoringDevice = YES;
    YFRGetDeviceInfo* request = [YFRGetDeviceInfo new];
    request.device = self.selectedDevice;
    request.delegate = self;
    [request doRequest];
}


#pragma mark - YFRDeviceInfoDelegate

- (void) onDeviceUpdate:(NSDictionary *)deviceInfo {
    NSNumber* value = [deviceInfo valueForKey:@"percent"];
    CGFloat angle = -[value floatValue];
    
    if (self.robotArmView.angle != angle) {
        [self.robotArmView setAngle:angle];
        [self.robotArmView setNeedsDisplay:YES];
    }
}

- (void) onMonitorEndedForDevice:(YFRDevice*) device {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.isMonitoringDevice = NO;
}


@end
