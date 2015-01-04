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

@property (weak, nonatomic) IBOutlet YFRRobotArmView* robotArmView;

@property BOOL isMonitoringDevice;

@end

@implementation YFRGuageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isMonitoringDevice = NO;
}

- (void) viewDidAppear:(BOOL)animated {
    [self monitorDevice:self.selectedDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onInputValueChanged:(id)sender {
    NSLog(@"onInputValueChanged: %@", sender);
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) onDeviceUpdate:(NSDictionary *)deviceInfo {
    NSNumber* value = [deviceInfo valueForKey:@"percent"];
    CGFloat angle = -[value floatValue];
    
    if (self.robotArmView.angle != angle) {
        [self.robotArmView setAngle:angle];
        [self.robotArmView setNeedsDisplay];
    }
}

- (void) onMonitorEndedForDevice:(YFRDevice*) device {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.isMonitoringDevice = NO;
}


@end
