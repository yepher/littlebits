//
//  YFRTokenEntryViewController.m
//  LittleBits
//
//  Created by Chris Wilson on 1/3/15.
//  Copyright (c) 2015 Yepher. All rights reserved.
//

#import "YFRTokenEntryViewController.h"
#import "YFRConstants.h"

@interface YFRTokenEntryViewController ()

@end

@implementation YFRTokenEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillDisappear:(BOOL)animated {
    if (self.apiTokenField.text == nil || self.apiTokenField.text.length == 0) {
        // TODO: show alert that user must enter
    } else {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:self.apiTokenField.text forKey:PREF_TOKEN_KEY];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onApiTokenHelp:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://developer.littlebitscloud.cc/access"]];

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
