//
//  YFRLittleBitsApplication.m
//  LittleBits
//
//  Created by Chris Wilson on 12/31/14.
//  Copyright (c) 2014 Yepher. All rights reserved.
//

#import "YFRLittleBitsApplication.h"
#import "YFRBuild.h"

@implementation YFRLittleBitsApplication

/**
 Puts some extra information in the About Dialog
 **/
- (void)orderFrontStandardAboutPanelWithOptions:(NSDictionary *)optionsDictionary {
    // Application Version
    NSMutableDictionary* newOptions = [NSMutableDictionary dictionaryWithDictionary:optionsDictionary];
    [newOptions setValue:[NSString stringWithFormat:@"Version: %@", YFR_VERSION] forKey:@"ApplicationVersion"];
    
    // Copyright with GIT Hash
    NSString *infoCopyRight = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSHumanReadableCopyright"];
    
    NSString* copyRight = [NSString stringWithFormat:@"%@\n\nGIT: %@\nBuild: %@", infoCopyRight, YFR_GIT_HASH, YFR_BUILD_DATE];
    [newOptions setValue:copyRight forKey:@"Copyright"];
    
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, newOptions);
    [super orderFrontStandardAboutPanelWithOptions:newOptions];
}

@end
